import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/network/dio_provider.dart';
import '../auth/device_identity_service.dart';
import 'sync_status_models.dart';

final syncStatusServiceProvider = Provider<SyncStatusService>((ref) {
  return DioSyncStatusService(
    dio: ref.watch(dioProvider),
    deviceIdentity: ref.watch(deviceIdentityServiceProvider),
  );
});

abstract class SyncStatusService {
  Future<SyncStatusRecord> fetchStatus({
    SyncStatusQuery query = const SyncStatusQuery(),
  });
}

class DioSyncStatusService implements SyncStatusService {
  DioSyncStatusService({required this.dio, required this.deviceIdentity});

  final Dio dio;
  final DeviceIdentityService deviceIdentity;

  @override
  Future<SyncStatusRecord> fetchStatus({
    SyncStatusQuery query = const SyncStatusQuery(),
  }) async {
    final deviceUuid = await deviceIdentity.getOrCreateDeviceUuid();
    final response = await dio.get<Map<String, dynamic>>(
      '/sync/status',
      queryParameters: query.toQueryParameters(deviceUuid: deviceUuid),
    );

    return SyncStatusRecord.fromJson(_asMap(response.data?['data']));
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}
