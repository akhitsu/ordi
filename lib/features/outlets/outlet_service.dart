import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/local/database_provider.dart';
import '../../data/network/dio_provider.dart';
import 'outlet_models.dart';

final outletServiceProvider = Provider<OutletService>((ref) {
  return DioOutletService(
    dio: ref.watch(dioProvider),
    database: ref.watch(databaseProvider),
  );
});

abstract class OutletService {
  Future<List<RemoteOutlet>> fetchOutlets({
    OutletQuery query = const OutletQuery(),
    bool saveLocal = true,
  });
}

class DioOutletService implements OutletService {
  DioOutletService({required this.dio, required this.database});

  final Dio dio;
  final AppDatabase database;

  @override
  Future<List<RemoteOutlet>> fetchOutlets({
    OutletQuery query = const OutletQuery(),
    bool saveLocal = true,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/outlets',
      queryParameters: query.toQueryParameters(),
    );
    final items = _readCollection(
      response.data,
    ).map(RemoteOutlet.fromJson).where((item) => item.uuid.isNotEmpty).toList();

    if (saveLocal) {
      await _saveOutlets(items, query: query);
    }

    return items;
  }

  Future<void> _saveOutlets(
    List<RemoteOutlet> items, {
    required OutletQuery query,
  }) async {
    final selectedUuids = await _selectedOutletUuids();
    await database.transaction(() async {
      for (final item in items) {
        final business = item.business;
        if (business.uuid.isNotEmpty) {
          await database
              .into(database.businesses)
              .insertOnConflictUpdate(
                BusinessesCompanion.insert(
                  uuid: business.uuid,
                  name: business.name,
                  timezone: Value(business.timezone),
                ),
              );
        }
      }

      await _clearExistingOutletsForQuery(query);

      for (final item in items) {
        await database
            .into(database.outlets)
            .insertOnConflictUpdate(
              OutletsCompanion.insert(
                uuid: item.uuid,
                businessUuid: Value(item.business.uuid),
                name: item.name,
                code: Value(item.code),
                role: Value(item.role),
                address: Value(item.address),
                phone: Value(item.phone),
                isActive: Value(item.isActive),
                revision: Value(item.revision),
                isSelected: Value(selectedUuids.contains(item.uuid)),
                updatedAt: Value(item.updatedAt),
              ),
            );
      }
    });
  }

  Future<void> _clearExistingOutletsForQuery(OutletQuery query) async {
    if (query.updatedAfter != null) {
      return;
    }

    final targetBusinessUuid = query.businessUuid;
    if (targetBusinessUuid == null || targetBusinessUuid.isEmpty) {
      await database.delete(database.outlets).go();
      return;
    }

    await (database.delete(
      database.outlets,
    )..where((row) => row.businessUuid.equals(targetBusinessUuid))).go();
  }

  Future<Set<String>> _selectedOutletUuids() async {
    final rows = await (database.select(
      database.outlets,
    )..where((row) => row.isSelected.equals(true))).get();
    return rows.map((row) => row.uuid).toSet();
  }
}

List<Map<String, dynamic>> _readCollection(Map<String, dynamic>? body) {
  final data = body?['data'];
  if (data is List) {
    return data.whereType<Map<String, dynamic>>().toList();
  }
  return const [];
}
