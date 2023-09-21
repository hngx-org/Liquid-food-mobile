import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/main/navigation/models/bottom_nav_item.dart';
import 'package:free_lunch_app/utils/res/icons.dart';

abstract class INavigationRepository {
  List<BottomNavItem> getDefaultNavItems();
}

class NavigationRepository extends INavigationRepository {
  @override
  List<BottomNavItem> getDefaultNavItems() {
    return [
      BottomNavItem(
        iconUnselected: AppIcons.home,
        iconSelected: AppIcons.homeActive,
        route: 'home',
        isSelected: true,
      ),
      BottomNavItem(
        iconUnselected: Icons.lunch_dining_outlined,
        iconSelected: Icons.lunch_dining,
        route: 'lunches',
        isSelected: false,
      ),
      BottomNavItem(
        iconUnselected: AppIcons.profile,
        iconSelected: AppIcons.profileActive,
        route: 'profile',
        isSelected: false,
      ),
    ];
  }
}
