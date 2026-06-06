import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppConfig {
  const AppConfig({required this.apiBaseUrl});

  final String apiBaseUrl;

  static const fromEnvironment = AppConfig(
    apiBaseUrl: String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'https://ordi.web.id/api',
    ),
  );
}

final appConfigProvider = Provider<AppConfig>((ref) {
  return AppConfig.fromEnvironment;
});
