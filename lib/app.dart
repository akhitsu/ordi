import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/splash_page.dart';

class OrdiApp extends StatelessWidget {
  const OrdiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ordi POS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      home: const SplashPage(),
    );
  }
}
