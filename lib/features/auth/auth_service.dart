import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/app_database.dart';
import '../../data/local/database_provider.dart';
import '../../data/network/dio_provider.dart';
import 'device_identity_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return DioAuthService(
    dio: ref.watch(dioProvider),
    database: ref.watch(databaseProvider),
    deviceIdentity: ref.watch(deviceIdentityServiceProvider),
  );
});

abstract class AuthService {
  Future<AuthSession?> restoreSession();

  Future<AuthSession> login({required String email, required String password});

  Future<void> logout();
}

class DioAuthService implements AuthService {
  DioAuthService({
    required this._dio,
    required this._database,
    required this._deviceIdentity,
  });

  final Dio _dio;
  final AppDatabase _database;
  final DeviceIdentityService _deviceIdentity;

  @override
  Future<AuthSession?> restoreSession() async {
    final query = _database.select(_database.authSessions)
      ..orderBy([(row) => OrderingTerm.desc(row.createdAt)])
      ..limit(1);
    return query.getSingleOrNull();
  }

  @override
  Future<AuthSession> login({
    required String email,
    required String password,
  }) async {
    final deviceUuid = await _deviceIdentity.getOrCreateDeviceUuid();
    final response = await _dio.post<Map<String, dynamic>>(
      '/login',
      data: {
        'email': email,
        'password': password,
        'device_uuid': deviceUuid,
        'device_name': _deviceIdentity.deviceName,
        'platform': _deviceIdentity.platform,
        'app_version': '1.0.0',
      },
    );

    final body = response.data ?? <String, dynamic>{};
    final user = _asMap(body['user']);
    final business = _asMap(user['business']);
    final device = _asMap(body['device']);
    final outlets = body['outlets'] is List
        ? body['outlets'] as List
        : const [];

    final tokenType = body['token_type']?.toString() ?? 'Bearer';
    final accessToken = body['access_token']?.toString();
    final userUuid = user['uuid']?.toString();
    final savedDeviceUuid = device['uuid']?.toString() ?? deviceUuid;
    final businessUuid = business['uuid']?.toString();
    final now = DateTime.now();

    if (accessToken == null || accessToken.isEmpty || userUuid == null) {
      throw const FormatException('Response login tidak lengkap.');
    }

    await _database.transaction(() async {
      if (businessUuid != null) {
        await _database
            .into(_database.businesses)
            .insertOnConflictUpdate(
              BusinessesCompanion.insert(
                uuid: businessUuid,
                name: business['name']?.toString() ?? '-',
                timezone: Value(
                  business['timezone']?.toString() ?? 'Asia/Jakarta',
                ),
              ),
            );
      }

      await _database
          .into(_database.localUsers)
          .insertOnConflictUpdate(
            LocalUsersCompanion.insert(
              uuid: userUuid,
              businessUuid: Value(businessUuid),
              name: user['name']?.toString() ?? '-',
              email: user['email']?.toString() ?? email,
              role: user['role']?.toString() ?? 'cashier',
            ),
          );

      await _database
          .into(_database.localDevices)
          .insertOnConflictUpdate(
            LocalDevicesCompanion.insert(
              uuid: savedDeviceUuid,
              name: device['name']?.toString() ?? _deviceIdentity.deviceName,
              platform: Value(device['platform']?.toString()),
              appVersion: Value(device['app_version']?.toString()),
              lastSeenAt: Value(_parseDateTime(device['last_seen_at'])),
            ),
          );

      await _database.delete(_database.authSessions).go();
      await _database
          .into(_database.authSessions)
          .insert(
            AuthSessionsCompanion.insert(
              tokenType: Value(tokenType),
              accessToken: accessToken,
              userUuid: userUuid,
              businessUuid: Value(businessUuid),
              deviceUuid: savedDeviceUuid,
              createdAt: now,
            ),
          );

      await _database.delete(_database.outlets).go();
      for (final rawOutlet in outlets) {
        final outlet = _asMap(rawOutlet);
        final outletUuid = outlet['uuid']?.toString();
        if (outletUuid == null || outletUuid.isEmpty) {
          continue;
        }

        await _database
            .into(_database.outlets)
            .insertOnConflictUpdate(
              OutletsCompanion.insert(
                uuid: outletUuid,
                businessUuid: Value(businessUuid),
                name: outlet['name']?.toString() ?? '-',
                code: Value(outlet['code']?.toString()),
                role: Value(outlet['role']?.toString()),
                isSelected: Value(outlets.length == 1),
                updatedAt: Value(now),
              ),
            );
      }
    });

    final session = await restoreSession();
    if (session == null) {
      throw StateError('Session login gagal disimpan.');
    }
    return session;
  }

  @override
  Future<void> logout() async {
    await _database.delete(_database.authSessions).go();
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}

DateTime? _parseDateTime(Object? value) {
  final text = value?.toString();
  if (text == null || text.isEmpty) {
    return null;
  }
  return DateTime.tryParse(text);
}
