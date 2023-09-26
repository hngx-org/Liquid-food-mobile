import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/repository/home.repo.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepoVM with ChangeNotifier {
  IRepositoryHome repositoryHome = HomeRepository();
  Future<List<dynamic>>? _coworkersList;
  Future<List<dynamic>>? get coworkersList => _coworkersList;

  String? _lunchCredits;
  String? get lunchCredit => _lunchCredits;

  String? _fullName;
  String? get fullName => _fullName;

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  Future<void> fetchUserProfile() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _lunchCredits = sp.get('lunch_balance').toString();
    _fullName = sp.getString('full_name').toString();
    _isAdmin = sp.getBool('isAdmin')!;
    notifyListeners();
  }

  void filterCoworkers(
      BuildContext context, TextEditingController searchController) {
    _coworkersList =
        repositoryHome.fetchCoworkerItems(context, searchController);
    notifyListeners();
    /* if (searchController.text.isNotEmpty) {
      _coworkersList = _coworkersList?.then((value) => value
          .where((coworker) => coworker.name!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList());
      notifyListeners();
    } else {
      _coworkersList;
      notifyListeners();
    } */
  }
}
