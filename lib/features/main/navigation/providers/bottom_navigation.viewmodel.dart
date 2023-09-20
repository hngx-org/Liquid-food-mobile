import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/main/navigation/models/bottom_nav_item.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';

class NavItemProvider with ChangeNotifier {
  String? tabSelection = 'home';
//  bool? isSelected = false;

  void setTabSelection(BottomNavItem item) {
    Utils.mainListNav.currentState!.pushReplacementNamed('/${item.route}');
    tabSelection = item.route;
    notifyListeners();
  }
}
