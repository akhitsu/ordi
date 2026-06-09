import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import 'widgets/rekap_kasir_body.dart';

class RekapKasirPage extends StatelessWidget {
  const RekapKasirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F4),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 56,
        title: const Text(
          'Rekap Kasir',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      body: RekapKasirBody(actionLabel: 'Rekap Transaksi', onActionTap: () {}),
    );
  }
}
