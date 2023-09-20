// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BottomNavItem {
  final IconData iconUnselected;
  final IconData iconSelected;
  final String route;
  final bool isSelected;
  BottomNavItem({
    required this.iconUnselected,
    required this.iconSelected,
    required this.route,
    required this.isSelected,
  });

  BottomNavItem copyWith({
    IconData? iconUnselected,
    IconData? iconSelected,
    String? route,
    bool? isSelected,
  }) {
    return BottomNavItem(
      iconUnselected: iconUnselected ?? this.iconUnselected,
      iconSelected: iconSelected ?? this.iconSelected,
      route: route ?? this.route,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
