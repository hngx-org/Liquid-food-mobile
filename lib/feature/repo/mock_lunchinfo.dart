import 'package:free_lunch_app/feature/lunches/models/lunch_model.dart';
import 'package:free_lunch_app/feature/repo/lunches_repo.dart';

class MockLunchRepository extends ILunchRepository {
  @override
  List<LunchInfo> getLunchInfo() {
    return [
      LunchInfo(
          image: 'assets/images/christian-buehner.jpg',
          fullName: 'Mark Essien',
          lunchReceived: 3,
          role: 'CTO',
          category: 'Yesterday'),
      LunchInfo(
          image: 'assets/images/dp.png',
          fullName: 'Olatunji Ruth',
          lunchReceived: 0,
          role: 'product Designer',
          category: 'Yesterday'),
      LunchInfo(
          image: 'assets/images/img.png',
          fullName: 'Mark Essien',
          lunchReceived: 1,
          role: 'CTO',
          category: 'Today'),
      LunchInfo(
          image: 'assets/images/img.png',
          fullName: 'Moammer',
          lunchReceived: 2,
          role: 'Team lead',
          category: 'Today'),
      LunchInfo(
          image: 'assets/images/christian-buehner.jpg',
          fullName: 'Lawrence ',
          lunchReceived: 3,
          role: 'Team member',
          category: 'Yesterday'),
      LunchInfo(
          image: 'assets/images/floral.jpg',
          fullName: 'Telvin Studios',
          lunchReceived: 1,
          role: 'Team Member',
          category: 'Yesterday'),
    ];
  }
}
