import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/database_provider.dart';
import '../../../data/network/dio_provider.dart';
import '../../../features/auth/auth_service.dart';
import '../../kasir/dashboard/dashboard_page.dart';
import '../login/login_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  String _statusMessage = 'Menyiapkan aplikasi...';
  double? _progress;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkSession());
  }

  Future<void> _checkSession() async {
    try {
      setState(() {
        _errorMessage = null;
      });

      await ref.read(databaseBootstrapProvider.notifier).prepareDatabase();
      if (!mounted) {
        return;
      }

      setState(() {
        _statusMessage = 'Memeriksa sesi login...';
        _progress = null;
      });

      final session = await ref.read(authServiceProvider).restoreSession();
      if (!mounted) {
        return;
      }

      if (session == null || session.accessToken.isEmpty) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(builder: (_) => const LoginPage()),
        );
        return;
      }

      ref.read(authTokenProvider.notifier).setToken(session.accessToken);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<void>(builder: (_) => const DashboardPage()),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _errorMessage =
            'Persiapan aplikasi gagal. Tutup paksa tidak diperlukan, silakan coba lagi.';
        _statusMessage = error.toString();
        _progress = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bootstrapState = ref.watch(databaseBootstrapProvider);
    final progress = bootstrapState.isRunning
        ? bootstrapState.progress
        : _progress;
    final message = bootstrapState.isRunning
        ? bootstrapState.message
        : _statusMessage;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 360),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/logo/logo_ordi.png',
                    width: 140,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'so smart, so simple.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const CircularProgressIndicator(),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 260,
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ),
                  if (_errorMessage != null) ...[
                    const SizedBox(height: 12),
                    SizedBox(
                      width: 280,
                      child: Text(
                        _errorMessage!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: theme.colorScheme.error),
                      ),
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: _checkSession,
                      child: const Text('Coba Lagi'),
                    ),
                  ],
                  if (progress != null) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 220,
                      child: LinearProgressIndicator(value: progress),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
