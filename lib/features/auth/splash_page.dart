import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local/database_provider.dart';
import '../../data/network/dio_provider.dart';
import '../home/home_page.dart';
import 'auth_repository.dart';
import 'login_page.dart';

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

      final session = await ref.read(authRepositoryProvider).restoreSession();
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
        MaterialPageRoute<void>(builder: (_) => const HomePage()),
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.point_of_sale, size: 56),
              const SizedBox(height: 16),
              const Text('Ordi POS'),
              const SizedBox(height: 16),
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              SizedBox(
                width: 240,
                child: Text(message, textAlign: TextAlign.center),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: 260,
                  child: Text(
                    _errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FilledButton(
                  onPressed: _checkSession,
                  child: const Text('Coba Lagi'),
                ),
              ],
              if (progress != null) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: 220,
                  child: LinearProgressIndicator(value: progress),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
