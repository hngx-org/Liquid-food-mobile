import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/models/lunch_model.dart';
import 'package:free_lunch_app/feature/repo/lunches_repo.dart';
import 'package:free_lunch_app/feature/repo/mock_lunchinfo.dart';

class LunchesViewModel extends ChangeNotifier {
  ILunchRepository lunchRepository = MockLunchRepository();

  Future<List<LunchInfo>> getLunchInfo() async {
    var lunchInfo = await lunchRepository.getLunchInfo();
    return lunchInfo;
    notifyListeners();
  }

  @override
  notifyListeners();
}
