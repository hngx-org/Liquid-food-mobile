import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/sendLunches/models/sendlunch.model.dart';
import 'package:free_lunch_app/features/sendLunches/repository/irepository.sendlunch.dart';
import 'package:free_lunch_app/features/sendLunches/repository/sendlunch_repository.dart';

class SendLunchVM with ChangeNotifier {
  IRepositorySendLunch sendLunchRepo = SendLunchRepository();

  bool _selectedCount = false;
  bool get selectedCount => _selectedCount;
  int _lunchCount = 0;
  int get lunchCount => _lunchCount;

  void setLunchCount(int count) {
    _lunchCount = count;
    _selectedCount = !_selectedCount;
    notifyListeners();
  }

  Future<void> sendLunch(
      BuildContext context, SendLunchItem sendLunchItem) async {
    sendLunchRepo.sendLunches(sendLunchItem).then((value) => {});
  }
}
