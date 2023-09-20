import 'package:free_lunch_app/features/main/navigation/models/bottom_nav_item.dart';
import 'package:free_lunch_app/utils/icons.dart';

abstract class INavigationRepository {
  List<BottomNavItem> getDefaultNavItems();
}

class NavigationRepository extends INavigationRepository {
  @override
  List<BottomNavItem> getDefaultNavItems() {
    return [
      BottomNavItem(
        icon: AppIcons.home,
        route: 'home',
        isSelected: true,
      ),
      BottomNavItem(
        icon: AppIcons.notification,
        route: 'lunches',
        isSelected: false,
      ),
      BottomNavItem(
        icon: AppIcons.profile,
        route: 'profile',
        isSelected: false,
      ),
    ];
  }
}
