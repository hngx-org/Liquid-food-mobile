import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/main/navigation/models/bottom_nav_item.dart';
import 'package:free_lunch_app/features/main/navigation/providers/bottom_navigation.viewmodel.dart';
import 'package:free_lunch_app/features/main/navigation/repository/navigation_repo_i.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    INavigationRepository navigationRepository = NavigationRepository();
    final navItems = navigationRepository.getDefaultNavItems();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(navItems.length, (index) {
          return BottomNavTile(item: navItems[index]);
        }),
      ),
    );
  }
}

class BottomNavTile extends StatelessWidget {
  final BottomNavItem item;
  const BottomNavTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavItemProvider>(builder: (context, navItem, child) {
      return Column(
        children: [
          IconButton(
            onPressed: () {
              navItem.setTabSelection(item);
            },
            icon: Icon(
              navItem.tabSelection == item.route
                  ? item.iconSelected
                  : item.iconUnselected,
              color: navItem.tabSelection == item.route
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
          navItem.tabSelection == item.route
              ? Container(
                  height: MediaQuery.sizeOf(context).height * .015,
                  width: MediaQuery.sizeOf(context).width * .015,
                  decoration: BoxDecoration(
                      color: navItem.tabSelection == item.route
                          ? Colors.blue
                          : Colors.black,
                      shape: BoxShape.circle),
                )
              : SizedBox(
                  height: MediaQuery.sizeOf(context).height * .015,
                  width: MediaQuery.sizeOf(context).width * .015,
                ),
        ],
      );
    });
  }
}
