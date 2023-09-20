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
        iconUnselected: AppIcons.arrowLeft,
        iconSelected: AppIcons.home,
        route: 'home',
        isSelected: true,
      ),
      BottomNavItem(
        iconUnselected: AppIcons.edit,
        iconSelected: AppIcons.notification,
        route: 'lunches',
        isSelected: false,
      ),
      BottomNavItem(
        iconUnselected: AppIcons.upload,
        iconSelected: AppIcons.profile,
        route: 'profile',
        isSelected: false,
      ),
    ];
  }
}
