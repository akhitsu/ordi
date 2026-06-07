import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/local/database_provider.dart';
import '../../data/network/dio_provider.dart';
import '../auth/device_identity_service.dart';
import 'cashier_recap_models.dart';

final cashierRecapRepositoryProvider = Provider<CashierRecapRepository>((ref) {
  return DioCashierRecapRepository(
    dio: ref.watch(dioProvider),
    database: ref.watch(databaseProvider),
    deviceIdentity: ref.watch(deviceIdentityServiceProvider),
  );
});

abstract class CashierRecapRepository {
  Future<CashierRecapRecord?> getActiveRecap({bool refresh = false});

  Future<List<CashierRecapRecord>> getRecaps({
    CashierRecapQuery query = const CashierRecapQuery(),
    bool refresh = false,
  });

  Future<CashierRecapRecord?> getRecapDetail(
    String recapUuid, {
    bool refresh = false,
  });

  Future<CashierRecapRecord> openShift({
    required DateTime openedAt,
    List<String> outletUuids = const [],
    String? notes,
  });

  Future<CashierRecapRecord> closeShift({
    required String recapUuid,
    required DateTime closedAt,
    String? notes,
  });
}

class DioCashierRecapRepository implements CashierRecapRepository {
  DioCashierRecapRepository({
    required this._dio,
    required this._database,
    required this._deviceIdentity,
  });

  final Dio _dio;
  final AppDatabase _database;
  final DeviceIdentityService _deviceIdentity;

  @override
  Future<CashierRecapRecord?> getActiveRecap({bool refresh = false}) async {
    if (refresh) {
      final remote = await getRecaps(
        query: const CashierRecapQuery(status: CashierRecapStatus.open),
        refresh: true,
      );
      return remote.firstOrNull;
    }

    final query = _database.select(_database.cashierRecaps)
      ..where((row) => row.status.equals(CashierRecapStatus.open.apiValue))
      ..orderBy([(row) => OrderingTerm.desc(row.openedAt)])
      ..limit(1);

    final row = await query.getSingleOrNull();
    return row == null ? null : _mapRow(row);
  }

  @override
  Future<List<CashierRecapRecord>> getRecaps({
    CashierRecapQuery query = const CashierRecapQuery(),
    bool refresh = false,
  }) async {
    if (refresh) {
      final response = await _dio.get<Map<String, dynamic>>(
        '/shifts',
        queryParameters: query.toQueryParameters(),
      );
      final items = _readCollection(
        response.data,
      ).map((item) => CashierRecapRecord.fromIndexJson(item)).toList();
      await _saveRecapCollection(items);
      return items;
    }

    final rows = await (_database.select(
      _database.cashierRecaps,
    )..orderBy([(row) => OrderingTerm.desc(row.openedAt)])).get();
    return rows
        .map(_mapRow)
        .where((item) => _matchesQuery(item, query))
        .toList();
  }

  @override
  Future<CashierRecapRecord?> getRecapDetail(
    String recapUuid, {
    bool refresh = false,
  }) async {
    if (refresh) {
      final response = await _dio.get<Map<String, dynamic>>(
        '/shifts/$recapUuid',
      );
      final record = CashierRecapRecord.fromDetailJson(
        _readDataMap(response.data),
      ).copyWith(syncedAt: DateTime.now(), updatedAt: DateTime.now());
      await _upsertRecap(record);
      return record;
    }

    final row = await (_database.select(
      _database.cashierRecaps,
    )..where((tbl) => tbl.recapUuid.equals(recapUuid))).getSingleOrNull();
    return row == null ? null : _mapRow(row);
  }

  @override
  Future<CashierRecapRecord> openShift({
    required DateTime openedAt,
    List<String> outletUuids = const [],
    String? notes,
  }) async {
    final deviceUuid = await _deviceIdentity.getOrCreateDeviceUuid();
    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/open',
      data: <String, dynamic>{
        'device_uuid': deviceUuid,
        'opened_at': openedAt.toIso8601String(),
        'outlet_uuids': outletUuids,
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      },
    );

    final record = CashierRecapRecord.fromOpenJson(_readDataMap(response.data))
        .copyWith(
          notes: notes,
          syncedAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
    await _upsertRecap(record);
    return record;
  }

  @override
  Future<CashierRecapRecord> closeShift({
    required String recapUuid,
    required DateTime closedAt,
    String? notes,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/shifts/$recapUuid/close',
      data: <String, dynamic>{
        'closed_at': closedAt.toIso8601String(),
        if (notes != null && notes.isNotEmpty) 'notes': notes,
      },
    );

    final record =
        CashierRecapRecord.fromDetailJson(_readDataMap(response.data)).copyWith(
          notes: notes,
          syncedAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
    await _upsertRecap(record);
    return record;
  }

  Future<void> _saveRecapCollection(List<CashierRecapRecord> items) async {
    final now = DateTime.now();
    await _database.transaction(() async {
      for (final item in items) {
        await _upsertRecap(item.copyWith(syncedAt: now, updatedAt: now));
      }
    });
  }

  Future<void> _upsertRecap(CashierRecapRecord record) {
    return _database
        .into(_database.cashierRecaps)
        .insertOnConflictUpdate(_toCompanion(record));
  }

  CashierRecapRecord _mapRow(CashierRecap row) {
    return CashierRecapRecord(
      recapUuid: row.recapUuid,
      status: CashierRecapStatus.fromValue(row.status),
      openedAt: row.openedAt,
      closedAt: row.closedAt,
      outletCount: row.outletCount,
      transactionCount: row.transactionCount,
      totalSales: row.totalSales,
      soldFrom: row.soldFrom,
      soldUntil: row.soldUntil,
      notes: row.notes,
      outlets: _decodeOutlets(row.outletsJson),
      cashier: _decodeCashier(row.cashierJson),
      device: _decodeDevice(row.deviceJson),
      summary: _decodeSummary(row.summaryJson),
      syncedAt: row.syncedAt,
      updatedAt: row.updatedAt,
    );
  }

  CashierRecapsCompanion _toCompanion(CashierRecapRecord record) {
    final now = record.updatedAt ?? DateTime.now();
    return CashierRecapsCompanion.insert(
      recapUuid: record.recapUuid,
      status: record.status.apiValue,
      openedAt: record.openedAt,
      closedAt: Value(record.closedAt),
      outletCount: Value(record.outletCount),
      transactionCount: Value(record.transactionCount),
      totalSales: Value(record.totalSales),
      soldFrom: Value(record.soldFrom),
      soldUntil: Value(record.soldUntil),
      notes: Value(record.notes),
      outletsJson: Value(
        record.outlets.isEmpty
            ? null
            : jsonEncode(record.outlets.map((item) => item.toJson()).toList()),
      ),
      cashierJson: Value(
        record.cashier == null ? null : jsonEncode(record.cashier!.toJson()),
      ),
      deviceJson: Value(
        record.device == null ? null : jsonEncode(record.device!.toJson()),
      ),
      summaryJson: Value(
        record.summary == null ? null : jsonEncode(record.summary!.toJson()),
      ),
      syncedAt: Value(record.syncedAt),
      updatedAt: now,
    );
  }

  bool _matchesQuery(CashierRecapRecord record, CashierRecapQuery query) {
    if (query.status != null && record.status != query.status) {
      return false;
    }
    if (query.dateFrom != null &&
        record.openedAt.isBefore(_startOfDay(query.dateFrom!))) {
      return false;
    }
    if (query.dateTo != null &&
        record.openedAt.isAfter(_endOfDay(query.dateTo!))) {
      return false;
    }
    return true;
  }

  DateTime _startOfDay(DateTime value) {
    final local = value.toLocal();
    return DateTime(local.year, local.month, local.day);
  }

  DateTime _endOfDay(DateTime value) {
    final local = value.toLocal();
    return DateTime(local.year, local.month, local.day, 23, 59, 59, 999);
  }

  List<CashierRecapOutlet> _decodeOutlets(String? value) {
    final list = _decodeJsonList(value);
    return list.map((item) => CashierRecapOutlet.fromJson(item)).toList();
  }

  CashierRecapCashier? _decodeCashier(String? value) {
    final map = _decodeJsonMap(value);
    if (map.isEmpty) {
      return null;
    }
    return CashierRecapCashier.fromJson(map);
  }

  CashierRecapDevice? _decodeDevice(String? value) {
    final map = _decodeJsonMap(value);
    if (map.isEmpty) {
      return null;
    }
    return CashierRecapDevice.fromJson(map);
  }

  CashierRecapSummary? _decodeSummary(String? value) {
    final map = _decodeJsonMap(value);
    if (map.isEmpty) {
      return null;
    }
    return CashierRecapSummary.fromJson(map);
  }

  Map<String, dynamic> _decodeJsonMap(String? value) {
    if (value == null || value.isEmpty) {
      return <String, dynamic>{};
    }
    final decoded = jsonDecode(value);
    if (decoded is Map<String, dynamic>) {
      return decoded;
    }
    if (decoded is Map) {
      return decoded.map((key, item) => MapEntry(key.toString(), item));
    }
    return <String, dynamic>{};
  }

  List<Map<String, dynamic>> _decodeJsonList(String? value) {
    if (value == null || value.isEmpty) {
      return const [];
    }
    final decoded = jsonDecode(value);
    if (decoded is! List) {
      return const [];
    }
    return decoded.map((item) => _mapDynamic(item)).toList();
  }

  List<Map<String, dynamic>> _readCollection(Map<String, dynamic>? body) {
    final data = body?['data'];
    if (data is! List) {
      return const [];
    }
    return data.map((item) => _mapDynamic(item)).toList();
  }

  Map<String, dynamic> _readDataMap(Map<String, dynamic>? body) {
    return _mapDynamic(body?['data']);
  }

  Map<String, dynamic> _mapDynamic(Object? value) {
    if (value is Map<String, dynamic>) {
      return value;
    }
    if (value is Map) {
      return value.map((key, item) => MapEntry(key.toString(), item));
    }
    return <String, dynamic>{};
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
