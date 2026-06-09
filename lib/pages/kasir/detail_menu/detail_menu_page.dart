import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../../core/theme/app_colors.dart';
import '../new_transaction/new_transaction_models.dart';
import 'widgets/add_to_transaction_button.dart';
import 'widgets/detail_menu_image.dart';
import 'widgets/detail_menu_info.dart';
import 'widgets/detail_quantity_selector.dart';

class DetailMenuPage extends StatefulWidget {
  const DetailMenuPage({super.key, required this.product});

  final CashierProduct product;

  @override
  State<DetailMenuPage> createState() => _DetailMenuPageState();
}

class _DetailMenuPageState extends State<DetailMenuPage> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 56,
        leading: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(TablerIcons.arrow_left, size: 28),
        ),
        title: const Text(
          'Detail Menu',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 18),
          children: [
            DetailMenuImage(product: widget.product),
            DetailMenuInfo(product: widget.product),
            DetailQuantitySelector(
              quantity: _quantity,
              onIncrement: () => setState(() => _quantity++),
              onDecrement: () {
                if (_quantity == 1) {
                  return;
                }
                setState(() => _quantity--);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: AddToTransactionButton(
        onPressed: () => Navigator.of(context).pop(_quantity),
      ),
    );
  }
}
