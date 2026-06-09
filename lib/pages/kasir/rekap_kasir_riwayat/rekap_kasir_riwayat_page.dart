import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../rekap_kasir/rekap_kasir_reprint.dart';
import 'rekap_kasir_riwayat_data.dart';
import 'widgets/rekap_kasir_riwayat_back_button.dart';
import 'widgets/rekap_kasir_riwayat_card.dart';

class RekapKasirRiwayatPage extends StatelessWidget {
  const RekapKasirRiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F4),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Riwayat Rekap',
          style: TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          itemCount: rekapKasirRiwayatItems.length,
          separatorBuilder: (_, _) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            return RekapKasirRiwayatCard(
              item: rekapKasirRiwayatItems[index],
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => const RekapKasirReprintPage(),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: RekapKasirRiwayatBackButton(
        onTap: () => Navigator.of(context).pop(),
      ),
    );
  }
}
