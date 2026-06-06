import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/responsive/responsive_breakpoints.dart';
import '../../data/network/dio_provider.dart';
import '../auth/auth_repository.dart';
import '../auth/login_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordi POS'),
        actions: [
          IconButton(
            tooltip: 'Sync',
            onPressed: () {},
            icon: const Icon(Icons.sync),
          ),
          IconButton(
            tooltip: 'Logout',
            onPressed: () async {
              await ref.read(authRepositoryProvider).logout();
              ref.read(authTokenProvider.notifier).clear();
              if (!context.mounted) {
                return;
              }
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(builder: (_) => const LoginPage()),
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: isTablet ? const _TabletHomeLayout() : const _PhoneHomeLayout(),
      ),
    );
  }
}

class _PhoneHomeLayout extends StatelessWidget {
  const _PhoneHomeLayout();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        _StatusPanel(),
        SizedBox(height: 16),
        _MenuPanel(),
        SizedBox(height: 16),
        _CartPanel(),
      ],
    );
  }
}

class _TabletHomeLayout extends StatelessWidget {
  const _TabletHomeLayout();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                _StatusPanel(),
                SizedBox(height: 16),
                Expanded(child: _MenuPanel()),
              ],
            ),
          ),
          SizedBox(width: 20),
          SizedBox(width: 360, child: _CartPanel()),
        ],
      ),
    );
  }
}

class _StatusPanel extends StatelessWidget {
  const _StatusPanel();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              Icons.storefront,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Outlet belum dipilih',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 4),
                  Text('Login dan pull master data menjadi tahap berikutnya.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuPanel extends StatelessWidget {
  const _MenuPanel();

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveBreakpoints.isTablet(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Menu', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            if (isTablet)
              const Expanded(child: _MenuPlaceholder())
            else
              const SizedBox(height: 180, child: _MenuPlaceholder()),
          ],
        ),
      ),
    );
  }
}

class _MenuPlaceholder extends StatelessWidget {
  const _MenuPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Katalog menu offline akan dibaca dari Drift.'),
    );
  }
}

class _CartPanel extends StatelessWidget {
  const _CartPanel();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Cart', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            const Text('Transaksi akan disimpan lokal sebelum sync.'),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: null,
              icon: const Icon(Icons.receipt_long),
              label: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
