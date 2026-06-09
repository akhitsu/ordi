import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/network/dio_provider.dart';
import '../../../features/auth/auth_service.dart';
import '../../auth/login/login_page.dart';
import '../kasir_info/kasir_info_page.dart';
import '../new_transaction/new_transaction_page.dart';
import 'kasir_bottom_navigation.dart';

export 'kasir_bottom_navigation.dart' show KasirMenuItem;

class KasirPageBottomNavigation extends ConsumerWidget {
  const KasirPageBottomNavigation({
    super.key,
    required this.selectedItem,
    this.onItemSelected,
  });

  final KasirMenuItem selectedItem;
  final FutureOr<void> Function(KasirMenuItem item)? onItemSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KasirBottomNavigation(
      selectedItem: selectedItem,
      onItemSelected: (item) async {
        if (onItemSelected != null) {
          await onItemSelected!(item);
          return;
        }

        if (item == KasirMenuItem.newTransaction) {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const NewTransactionPage()),
          );
          return;
        }

        if (item == KasirMenuItem.cashier) {
          await Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const KasirInfoPage()),
          );
          return;
        }

        if (item != KasirMenuItem.history && item != KasirMenuItem.menu) {
          return;
        }
      },
    );
  }
}

Future<void> logoutKasir(BuildContext context, WidgetRef ref) async {
  await ref.read(authServiceProvider).logout();
  ref.read(authTokenProvider.notifier).clear();
  if (!context.mounted) {
    return;
  }
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute<void>(builder: (_) => const LoginPage()),
    (_) => false,
  );
}
