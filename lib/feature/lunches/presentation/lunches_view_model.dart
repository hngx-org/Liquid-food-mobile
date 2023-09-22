import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/models/lunch_model.dart';
import 'package:free_lunch_app/feature/repo/lunches_repo.dart';
import 'package:free_lunch_app/feature/repo/mock_lunchinfo.dart';
import 'package:provider/provider.dart';

class LunchesViewModel extends ChangeNotifier {
  ILunchRepository lunchRepository = MockLunchRepository();

  List<LunchInfo> _lunchinfo = [];
  List<LunchInfo> get lunchinfo => _lunchinfo;

  int numberOFl = 12;

  List<LunchInfo>? getLunchInfo() {
    List<LunchInfo> lunchInfo = lunchRepository.getLunchInfo();
    _lunchinfo = lunchInfo;
    notifyListeners();
  }
}
