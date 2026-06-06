import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/config/app_config.dart';
import 'api_exception.dart';

final authTokenProvider = NotifierProvider<AuthTokenNotifier, String?>(
  AuthTokenNotifier.new,
);

class AuthTokenNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setToken(String token) {
    state = token;
  }

  void clear() {
    state = null;
  }
}

final dioProvider = Provider<Dio>((ref) {
  final config = ref.watch(appConfigProvider);
  final dio = Dio(
    BaseOptions(
      baseUrl: config.apiBaseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      sendTimeout: const Duration(seconds: 20),
      headers: const {
        Headers.acceptHeader: 'application/json',
        Headers.contentTypeHeader: 'application/json',
      },
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = ref.read(authTokenProvider);
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) {
        handler.reject(_mapDioError(error));
      },
    ),
  );

  return dio;
});

DioException _mapDioError(DioException error) {
  final response = error.response;
  final data = response?.data;

  if (data is Map<String, dynamic>) {
    final message = data['message']?.toString() ?? 'Terjadi kesalahan API.';
    final errors = data['errors'] is Map<String, dynamic>
        ? data['errors'] as Map<String, dynamic>
        : null;

    return error.copyWith(
      error: ApiException(
        message: message,
        statusCode: response?.statusCode,
        errors: errors,
      ),
    );
  }

  return error.copyWith(
    error: ApiException(
      message: error.message ?? 'Tidak dapat terhubung ke server.',
      statusCode: response?.statusCode,
    ),
  );
}
