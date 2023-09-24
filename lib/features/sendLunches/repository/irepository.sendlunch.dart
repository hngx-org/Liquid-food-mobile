import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/sendLunches/models/sendlunch.model.dart';

abstract class IRepositorySendLunch {
  Future<void> sendLunches(BuildContext context, SendLunchItem sendLunchItem);
}
