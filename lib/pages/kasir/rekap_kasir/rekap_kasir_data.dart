import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class RekapKasirSummaryCardData {
  const RekapKasirSummaryCardData({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.iconBackground,
    required this.iconColor,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
}

class RekapKasirPaymentRowData {
  const RekapKasirPaymentRowData({
    required this.methodName,
    required this.transactionCount,
    required this.amount,
    required this.icon,
    required this.accentColor,
  });

  final String methodName;
  final int transactionCount;
  final String amount;
  final IconData icon;
  final Color accentColor;
}

const rekapKasirDateRangeLabel = '21 Mei 2025 - 23 Mei 2025';
const rekapKasirDateRangeNote =
    'Data rekap ini berdasarkan transaksi yang diselesaikan pada rentang 21 Mei 2025 - 23 Mei 2025 (00:00 - 23:59).';

const rekapKasirSummaryCards = <RekapKasirSummaryCardData>[
  RekapKasirSummaryCardData(
    title: 'Total Transaksi',
    value: '145',
    subtitle: 'Transaksi',
    icon: TablerIcons.receipt_2,
    iconBackground: Color(0xFFDDF6E8),
    iconColor: Color(0xFF0B7A38),
  ),
  RekapKasirSummaryCardData(
    title: 'Total Omset',
    value: 'Rp 12.850.000',
    subtitle: 'Total Penjualan',
    icon: TablerIcons.wallet,
    iconBackground: Color(0xFFDDF6E8),
    iconColor: Color(0xFF0B7A38),
  ),
];

const rekapKasirPaymentRows = <RekapKasirPaymentRowData>[
  RekapKasirPaymentRowData(
    methodName: 'CASH',
    transactionCount: 120,
    amount: 'Rp 8.500.000',
    icon: TablerIcons.cash,
    accentColor: Color(0xFF16A34A),
  ),
  RekapKasirPaymentRowData(
    methodName: 'QRIS',
    transactionCount: 25,
    amount: 'Rp 520.000',
    icon: TablerIcons.qrcode,
    accentColor: Color(0xFF3B82F6),
  ),
  RekapKasirPaymentRowData(
    methodName: 'DEBIT',
    transactionCount: 15,
    amount: 'Rp 1.250.000',
    icon: TablerIcons.credit_card,
    accentColor: Color(0xFF8B5CF6),
  ),
  RekapKasirPaymentRowData(
    methodName: 'TRANSFER',
    transactionCount: 8,
    amount: 'Rp 400.000',
    icon: TablerIcons.building_bank,
    accentColor: Color(0xFFF59E0B),
  ),
  RekapKasirPaymentRowData(
    methodName: 'E-WALLET',
    transactionCount: 5,
    amount: 'Rp 180.000',
    icon: TablerIcons.wallet,
    accentColor: Color(0xFFEF5A73),
  ),
];
