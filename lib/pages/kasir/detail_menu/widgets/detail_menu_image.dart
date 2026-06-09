import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../new_transaction/new_transaction_models.dart';

class DetailMenuImage extends StatelessWidget {
  const DetailMenuImage({super.key, required this.product});

  final CashierProduct product;

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.imageUrl.trim();

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
      child: AspectRatio(
        aspectRatio: 1.12,
        child: imageUrl.isEmpty
            ? _DetailMenuInitials(name: product.name)
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) =>
                    _DetailMenuInitials(name: product.name),
              ),
      ),
    );
  }
}

class _DetailMenuInitials extends StatelessWidget {
  const _DetailMenuInitials({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEAF5EF),
      alignment: Alignment.center,
      child: Text(
        _initials(name),
        style: const TextStyle(
          color: AppColors.primary,
          fontSize: 54,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

String _initials(String value) {
  final words = value
      .trim()
      .split(RegExp(r'\s+'))
      .where((word) => word.isNotEmpty)
      .toList();

  if (words.isEmpty) {
    return '?';
  }

  if (words.length == 1) {
    final word = words.first;
    return word.substring(0, word.length >= 2 ? 2 : 1).toUpperCase();
  }

  return '${words[0][0]}${words[1][0]}'.toUpperCase();
}
