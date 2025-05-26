import 'package:fake_store/common/extensions/context_ext.dart';
import 'package:fake_store/common/widgets/custom_svg.dart';
import 'package:flutter/material.dart';

import '../constants/assets.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavBarItem(icon: Assets.icons.home, index: 0),
      _NavBarItem(icon: Assets.icons.like, index: 1),
      _NavBarItem(icon: Assets.icons.shop, index: 2),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: context.color.textFieldBackgroundColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
            items.map((item) {
              final isSelected = currentIndex == item.index;

              return GestureDetector(
                onTap: () => onTap(item.index),
                child: CustomSvg(
                  asset: item.icon,
                  width: 24,
                  height: 24,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              );
            }).toList(),
      ),
    );
  }
}

class _NavBarItem {
  final String icon;
  final int index;

  _NavBarItem({required this.icon, required this.index});
}
