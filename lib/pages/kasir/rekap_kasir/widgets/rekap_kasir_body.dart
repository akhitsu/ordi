import 'package:flutter/material.dart';

import '../rekap_kasir_data.dart';
import 'rekap_kasir_action_button.dart';
import 'rekap_kasir_date_card.dart';
import 'rekap_kasir_note_card.dart';
import 'rekap_kasir_payment_section.dart';
import 'rekap_kasir_summary_card.dart';

class RekapKasirBody extends StatelessWidget {
  const RekapKasirBody({
    super.key,
    required this.actionLabel,
    required this.onActionTap,
  });

  final String actionLabel;
  final VoidCallback onActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
        children: [
          RekapKasirDateCard(
            title: 'Tanggal',
            rangeLabel: rekapKasirDateRangeLabel,
            onTap: () {},
          ),
          const SizedBox(height: 14),
          const RekapKasirSummaryCard(items: rekapKasirSummaryCards),
          const SizedBox(height: 16),
          const RekapKasirPaymentSection(items: rekapKasirPaymentRows),
          const SizedBox(height: 8),
          const RekapKasirNoteCard(
            title: 'Informasi',
            message: rekapKasirDateRangeNote,
          ),
          const SizedBox(height: 16),
          RekapKasirActionButton(label: actionLabel, onTap: onActionTap),
        ],
      ),
    );
  }
}
