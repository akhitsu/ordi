import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/network/dio_provider.dart';
import '../auth/device_identity_service.dart';
import 'sales_models.dart';

final salesServiceProvider = Provider<SalesService>((ref) {
  return DioSalesService(
    dio: ref.watch(dioProvider),
    deviceIdentity: ref.watch(deviceIdentityServiceProvider),
  );
});

abstract class SalesService {
  Future<SaleRecord> createSale(SaleCreateRequest request);
}

class DioSalesService implements SalesService {
  DioSalesService({required this.dio, required this.deviceIdentity});

  final Dio dio;
  final DeviceIdentityService deviceIdentity;

  @override
  Future<SaleRecord> createSale(SaleCreateRequest request) async {
    final deviceUuid = await deviceIdentity.getOrCreateDeviceUuid();
    final response = await dio.post<Map<String, dynamic>>(
      '/sales',
      data: request.toJson(deviceUuid: deviceUuid),
      options: Options(
        headers: <String, dynamic>{'Idempotency-Key': request.idempotencyKey},
      ),
    );

    return SaleRecord.fromJson(_asMap(response.data?['data']));
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}
