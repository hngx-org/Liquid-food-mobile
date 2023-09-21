import 'package:free_lunch_app/feature/lunches/models/lunch_model.dart';

abstract class ILunchRepository {
  List<LunchInfo> getLunchInfo();
}
