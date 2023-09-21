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
          when: 'Yesterday'),
      LunchInfo(
          image: 'assets/images/dp.png',
          fullName: 'Mark Essien',
          lunchReceived: 0,
          role: 'CTO',
          when: 'Yesterday'),
      LunchInfo(
          image: 'assets/images/img.png',
          fullName: 'Mark Essien',
          lunchReceived: 1,
          role: 'CTO',
          when: 'Today'),
      LunchInfo(
          image: 'assets/images/img.png',
          fullName: 'Mark Essien',
          lunchReceived: 2,
          role: 'CTO',
          when: 'Today'),
      LunchInfo(
          image: 'assets/images/christian-buehner.jpg',
          fullName: 'Mark Essien',
          lunchReceived: 3,
          role: 'CTO',
          when: 'Yesterday'),
      LunchInfo(
          image: 'assets/images/floral.jpg',
          fullName: 'Mark Essien',
          lunchReceived: 1,
          role: 'CTO',
          when: 'Yesterday'),
    ];
  }
}
