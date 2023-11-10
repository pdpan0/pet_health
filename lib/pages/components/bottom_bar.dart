import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pet_health/constants/colors.dart';
import 'package:pet_health/models/components/bottom_bar_item.dart';

class BottomBar extends StatelessWidget {
  final int activeIndex;
  final List<BottomBarItem> items;
  final Function(int) onTap;

  const BottomBar({
    super.key,
    required this.activeIndex,
    required this.items,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: items.map((e) => e.icon).toList(),
      activeColor: primary,
      splashColor: secondary,
      activeIndex: activeIndex,
      inactiveColor: black.withOpacity(0.5),
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      onTap: onTap
    );
  }
}
