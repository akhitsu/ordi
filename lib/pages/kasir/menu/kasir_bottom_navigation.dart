import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../../../core/theme/app_colors.dart';

enum KasirMenuItem { home, history, newTransaction, menu, profile }

class KasirBottomNavigation extends StatelessWidget {
  const KasirBottomNavigation({
    super.key,
    required this.selectedItem,
    required this.onItemSelected,
  });

  final KasirMenuItem selectedItem;
  final ValueChanged<KasirMenuItem> onItemSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned.fill(
            top: 18,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x14000000),
                    blurRadius: 16,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 14, 12, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: _KasirNavItem(
                        icon: TablerIcons.home,
                        activeIcon: TablerIcons.home_filled,
                        label: 'Home',
                        isActive: selectedItem == KasirMenuItem.home,
                        onTap: () => onItemSelected(KasirMenuItem.home),
                      ),
                    ),
                    Expanded(
                      child: _KasirNavItem(
                        icon: TablerIcons.receipt_2,
                        label: 'Riwayat',
                        isActive: selectedItem == KasirMenuItem.history,
                        onTap: () => onItemSelected(KasirMenuItem.history),
                      ),
                    ),
                    const SizedBox(width: 72),
                    Expanded(
                      child: _KasirNavItem(
                        icon: TablerIcons.book_2,
                        label: 'Menu',
                        isActive: selectedItem == KasirMenuItem.menu,
                        onTap: () => onItemSelected(KasirMenuItem.menu),
                      ),
                    ),
                    Expanded(
                      child: _KasirNavItem(
                        icon: TablerIcons.user,
                        label: 'Profile',
                        isActive: selectedItem == KasirMenuItem.profile,
                        onTap: () => onItemSelected(KasirMenuItem.profile),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Column(
              children: [
                Material(
                  color: AppColors.primary,
                  shape: const CircleBorder(),
                  elevation: 8,
                  shadowColor: const Color(0x33055E2C),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () => onItemSelected(KasirMenuItem.newTransaction),
                    child: const SizedBox(
                      width: 58,
                      height: 58,
                      child: Icon(
                        TablerIcons.shopping_cart_plus,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Transaksi Baru',
                  style: TextStyle(
                    color: selectedItem == KasirMenuItem.newTransaction
                        ? AppColors.primary
                        : AppColors.textPrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KasirNavItem extends StatelessWidget {
  const _KasirNavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.activeIcon,
  });

  final IconData icon;
  final IconData? activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.primary : const Color(0xFF777D85);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              activeIcon != null && isActive ? activeIcon : icon,
              color: color,
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
