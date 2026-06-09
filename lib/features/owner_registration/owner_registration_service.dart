import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/network/dio_provider.dart';
import 'owner_registration_models.dart';

final ownerRegistrationServiceProvider = Provider<OwnerRegistrationService>((
  ref,
) {
  return DioOwnerRegistrationService(dio: ref.watch(dioProvider));
});

abstract class OwnerRegistrationService {
  Future<OwnerRegisterResponse> registerOwner(OwnerRegisterRequest request);
}

class DioOwnerRegistrationService implements OwnerRegistrationService {
  const DioOwnerRegistrationService({required this.dio});

  final Dio dio;

  @override
  Future<OwnerRegisterResponse> registerOwner(
    OwnerRegisterRequest request,
  ) async {
    final response = await dio.post<Map<String, dynamic>>(
      '/owners/register',
      data: request.toJson(),
    );

    return OwnerRegisterResponse.fromJson(response.data ?? <String, dynamic>{});
  }
}
