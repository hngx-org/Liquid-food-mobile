import 'package:free_lunch_app/features/sendLunches/models/sendlunch.model.dart';

abstract class IRepositorySendLunch {
  Future<dynamic> sendLunches(SendLunchItem sendLunchItem);
}
