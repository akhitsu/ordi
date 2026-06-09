import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/local/database_provider.dart';
import '../../data/network/dio_provider.dart';
import 'master_data_models.dart';

final masterDataServiceProvider = Provider<MasterDataService>((ref) {
  return DioMasterDataService(
    dio: ref.watch(dioProvider),
    database: ref.watch(databaseProvider),
  );
});

abstract class MasterDataService {
  Future<List<RemoteMenuCategory>> fetchMenuCategories({
    MasterDataQuery query = const MasterDataQuery(),
    bool saveLocal = true,
  });

  Future<List<RemoteMenuItem>> fetchMenuItems({
    MasterDataQuery query = const MasterDataQuery(),
    bool saveLocal = true,
  });

  Future<List<RemotePaymentMethod>> fetchPaymentMethods({
    bool saveLocal = true,
  });

  Future<List<RemoteDiningTable>> fetchDiningTables({
    MasterDataQuery query = const MasterDataQuery(),
    bool saveLocal = true,
  });
}

class DioMasterDataService implements MasterDataService {
  DioMasterDataService({required this.dio, required this.database});

  final Dio dio;
  final AppDatabase database;

  @override
  Future<List<RemoteMenuCategory>> fetchMenuCategories({
    MasterDataQuery query = const MasterDataQuery(),
    bool saveLocal = true,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/menu-categories',
      queryParameters: query.toQueryParameters(),
    );
    final items = _readCollection(
      response.data,
    ).map(RemoteMenuCategory.fromJson).where((item) => item.uuid.isNotEmpty);

    final result = items.toList();
    if (saveLocal) {
      await _saveMenuCategories(result);
    }
    return result;
  }

  @override
  Future<List<RemoteMenuItem>> fetchMenuItems({
    MasterDataQuery query = const MasterDataQuery(),
    bool saveLocal = true,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/menu-items',
      queryParameters: query.toQueryParameters(),
    );
    final items = _readCollection(
      response.data,
    ).map(RemoteMenuItem.fromJson).where((item) => item.uuid.isNotEmpty);

    final result = items.toList();
    if (saveLocal) {
      await _saveMenuItems(result);
    }
    return result;
  }

  @override
  Future<List<RemotePaymentMethod>> fetchPaymentMethods({
    bool saveLocal = true,
  }) async {
    final response = await dio.get<Map<String, dynamic>>('/payment-methods');
    final items = _readCollection(
      response.data,
    ).map(RemotePaymentMethod.fromJson).where((item) => item.uuid.isNotEmpty);

    final result = items.toList();
    if (saveLocal) {
      await _savePaymentMethods(result);
    }
    return result;
  }

  @override
  Future<List<RemoteDiningTable>> fetchDiningTables({
    MasterDataQuery query = const MasterDataQuery(),
    bool saveLocal = true,
  }) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/dining-tables',
      queryParameters: query.toQueryParameters(),
    );
    final items = _readCollection(
      response.data,
    ).map(RemoteDiningTable.fromJson).where((item) => item.uuid.isNotEmpty);

    final result = items.toList();
    if (saveLocal) {
      await _saveDiningTables(result);
    }
    return result;
  }

  Future<String?> _currentBusinessUuid() async {
    final query = database.select(database.authSessions)
      ..orderBy([(row) => OrderingTerm.desc(row.createdAt)])
      ..limit(1);
    final session = await query.getSingleOrNull();
    return session?.businessUuid;
  }

  Future<void> _saveMenuCategories(List<RemoteMenuCategory> items) async {
    final businessUuid = await _currentBusinessUuid();
    await database.transaction(() async {
      for (final item in items) {
        await database
            .into(database.menuCategories)
            .insertOnConflictUpdate(
              MenuCategoriesCompanion.insert(
                uuid: item.uuid,
                businessUuid: Value(businessUuid),
                outletUuid: item.outlet.uuid,
                name: item.name,
                sortOrder: Value(item.sortOrder),
                revision: Value(item.revision),
                updatedAt: Value(item.updatedAt),
              ),
            );
      }
    });
  }

  Future<void> _saveMenuItems(List<RemoteMenuItem> items) async {
    final businessUuid = await _currentBusinessUuid();
    await database.transaction(() async {
      for (final item in items) {
        await database
            .into(database.menuItems)
            .insertOnConflictUpdate(
              MenuItemsCompanion.insert(
                uuid: item.uuid,
                businessUuid: Value(businessUuid),
                outletUuid: item.outlet.uuid,
                categoryUuid: Value(item.category?.uuid),
                name: item.name,
                description: Value(item.description),
                sku: Value(item.sku),
                imageUrl: Value(item.imageUrl),
                price: item.price,
                isRetailReady: Value(item.isRetailReady),
                revision: Value(item.revision),
                updatedAt: Value(item.updatedAt),
              ),
            );
      }
    });
  }

  Future<void> _savePaymentMethods(List<RemotePaymentMethod> items) async {
    final businessUuid = await _currentBusinessUuid();
    await database.transaction(() async {
      for (final item in items) {
        await database
            .into(database.paymentMethods)
            .insertOnConflictUpdate(
              PaymentMethodsCompanion.insert(
                uuid: item.uuid,
                businessUuid: Value(businessUuid),
                name: item.name,
                code: item.code,
                sortOrder: Value(item.sortOrder),
                revision: Value(item.revision),
                updatedAt: Value(item.updatedAt),
              ),
            );
      }
    });
  }

  Future<void> _saveDiningTables(List<RemoteDiningTable> items) async {
    final businessUuid = await _currentBusinessUuid();
    await database.transaction(() async {
      for (final item in items) {
        await database
            .into(database.diningTables)
            .insertOnConflictUpdate(
              DiningTablesCompanion.insert(
                uuid: item.uuid,
                businessUuid: Value(businessUuid),
                outletUuid: item.outlet.uuid,
                name: item.name,
                number: Value(item.number),
                revision: Value(item.revision),
                updatedAt: Value(item.updatedAt),
              ),
            );
      }
    });
  }
}

List<Map<String, dynamic>> _readCollection(Map<String, dynamic>? body) {
  final data = body?['data'];
  if (data is List) {
    return data.whereType<Map<String, dynamic>>().toList();
  }
  return const [];
}
