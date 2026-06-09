import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/network/dio_provider.dart';
import '../auth/device_identity_service.dart';
import 'payment_models.dart';

final paymentServiceProvider = Provider<PaymentService>((ref) {
  return DioPaymentService(
    dio: ref.watch(dioProvider),
    deviceIdentity: ref.watch(deviceIdentityServiceProvider),
  );
});

abstract class PaymentService {
  Future<PaymentRecord> createPayment(PaymentCreateRequest request);
}

class DioPaymentService implements PaymentService {
  DioPaymentService({required this._dio, required this._deviceIdentity});

  final Dio _dio;
  final DeviceIdentityService _deviceIdentity;

  @override
  Future<PaymentRecord> createPayment(PaymentCreateRequest request) async {
    final deviceUuid = await _deviceIdentity.getOrCreateDeviceUuid();
    final response = await _dio.post<Map<String, dynamic>>(
      '/payments',
      data: request.toJson(deviceUuid: deviceUuid),
      options: Options(
        headers: <String, dynamic>{'Idempotency-Key': request.idempotencyKey},
      ),
    );

    final body = response.data ?? <String, dynamic>{};
    return PaymentRecord.fromJson(_asMap(body['data']));
  }
}

Map<String, dynamic> _asMap(Object? value) {
  if (value is Map<String, dynamic>) {
    return value;
  }
  return <String, dynamic>{};
}
