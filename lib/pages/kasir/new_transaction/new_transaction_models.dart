import 'package:flutter/material.dart';

class CashierCategory {
  const CashierCategory({required this.label, required this.icon, this.key});

  final String label;
  final IconData icon;
  final String? key;
}

class CashierProduct {
  const CashierProduct({
    required this.uuid,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.outletUuid,
    required this.imageUrl,
  });

  final String uuid;
  final String name;
  final String description;
  final int price;
  final String category;
  final String outletUuid;
  final String imageUrl;
}
