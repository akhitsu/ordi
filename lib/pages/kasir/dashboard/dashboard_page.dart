import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/local/database_provider.dart';
import '../../../features/auth/auth_service.dart';
import '../../../features/outlets/outlet_models.dart';
import '../../../features/outlets/outlet_service.dart';
import '../menu/kasir_page_bottom_navigation.dart';
import '../pending/pending_page.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/greeting_card.dart';
import 'widgets/pending_transaction_button.dart';
import 'widgets/revenue_card.dart';
import 'widgets/section_header.dart';
import 'widgets/transaction_card.dart';

final dashboardSessionProvider = FutureProvider<DashboardSessionData>((
  ref,
) async {
  final database = ref.watch(databaseProvider);
  final session = await ref.watch(authServiceProvider).restoreSession();
  if (session == null) {
    throw StateError('Sesi login tidak ditemukan.');
  }

  final user = await (database.select(
    database.localUsers,
  )..where((row) => row.uuid.equals(session.userUuid))).getSingleOrNull();

  final business = session.businessUuid == null
      ? null
      : await (database.select(database.businesses)
              ..where((row) => row.uuid.equals(session.businessUuid!)))
            .getSingleOrNull();

  final outlets = await ref.watch(outletServiceProvider).fetchOutlets();

  return DashboardSessionData(
    cashierName: user?.name ?? 'Kasir',
    businessName: business?.name ?? 'Ordi POS',
    outlets: outlets,
  );
});

class DashboardSessionData {
  const DashboardSessionData({
    required this.cashierName,
    required this.businessName,
    required this.outlets,
  });

  final String cashierName;
  final String businessName;
  final List<RemoteOutlet> outlets;

  String get outletLabel {
    if (outlets.isEmpty) {
      return 'Belum ada outlet';
    }

    final firstOutlet = outlets.first.name;
    if (outlets.length == 1) {
      return firstOutlet;
    }

    return '$firstOutlet +${outlets.length - 1} outlet';
  }
}

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(dashboardSessionProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F4),
      body: sessionState.when(
        data: (session) => _DashboardContent(session: session),
        loading: () => const _DashboardLoading(),
        error: (error, _) => _DashboardError(
          onRetry: () => ref.invalidate(dashboardSessionProvider),
        ),
      ),
      bottomNavigationBar: const SafeArea(
        top: false,
        child: KasirPageBottomNavigation(selectedItem: KasirMenuItem.home),
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.session});

  final DashboardSessionData session;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/bg-image.png',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  child: Column(
                    children: [
                      DashboardHeader(
                        businessName: session.businessName,
                        outletLabel: session.outletLabel,
                        onNotificationTap: () {},
                      ),
                      const SizedBox(height: 16),
                      GreetingCard(now: now, cashierName: session.cashierName),
                      const SizedBox(height: 14),
                      const RevenueCard(),
                      const SizedBox(height: 14),
                      PendingTransactionButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (_) => const PendingPage(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 22),
                      SectionHeader(
                        title: 'Riwayat Transaksi',
                        actionLabel: 'Lihat Semua',
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                sliver: SliverList.separated(
                  itemCount: _demoTransactions.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final item = _demoTransactions[index];
                    return TransactionCard(item: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DashboardLoading extends StatelessWidget {
  const _DashboardLoading();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Center(child: CircularProgressIndicator()));
  }
}

class _DashboardError extends StatelessWidget {
  const _DashboardError({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Data dashboard gagal dimuat.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1D1F24),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              FilledButton(onPressed: onRetry, child: const Text('Coba Lagi')),
            ],
          ),
        ),
      ),
    );
  }
}

const _demoTransactions = [
  DashboardTransactionItem(
    invoice: 'INV-210525-00156',
    date: '21 Mei 2025',
    time: '09:35',
    table: 'Meja 05',
    total: 'Rp 125.000',
    status: 'Selesai',
  ),
  DashboardTransactionItem(
    invoice: 'INV-210525-00155',
    date: '21 Mei 2025',
    time: '09:20',
    table: 'Meja 02',
    total: 'Rp 98.000',
    status: 'Selesai',
  ),
  DashboardTransactionItem(
    invoice: 'INV-210525-00154',
    date: '21 Mei 2025',
    time: '09:05',
    table: 'Meja 03',
    total: 'Rp 76.000',
    status: 'Selesai',
  ),
  DashboardTransactionItem(
    invoice: 'INV-210525-00153',
    date: '21 Mei 2025',
    time: '08:50',
    table: 'Meja 01',
    total: 'Rp 140.000',
    status: 'Pending',
  ),
  DashboardTransactionItem(
    invoice: 'INV-210525-00152',
    date: '21 Mei 2025',
    time: '08:30',
    table: 'Take Away',
    total: 'Rp 60.000',
    status: 'Selesai',
  ),
];
