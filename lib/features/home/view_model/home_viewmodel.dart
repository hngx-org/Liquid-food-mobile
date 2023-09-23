import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/models/search_by_email.model.dart';
import 'package:free_lunch_app/features/home/repository/home.repo.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:free_lunch_app/features/home/user_balance/user_balance.repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepoVM with ChangeNotifier {
  IRepositoryHome repositoryHome = HomeRepository();
  IUserBalanceRepo userBalanceRepo = UserBalanceRepo();
  Future<List<CoWorker>>? _coworkersList;
  Future<List<CoWorker>>? get coworkersList => _coworkersList;

  Future<List<UserbyEmail>>? _coworkerbyEmail;
  Future<List<UserbyEmail>>? get coworkerbyEmail => _coworkerbyEmail;

  String? _lunchCredits;
  String? get lunchCredit => _lunchCredits;

  void fetchCredit(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _lunchCredits = sp.get('balance').toString() ?? '0';
    notifyListeners();
  }

  void filterCoworkers(
      BuildContext context, TextEditingController searchController) {
    _coworkersList =
        repositoryHome.fetchCoworkerItems(context, searchController);
    notifyListeners();
    /* _coworkerbyEmail =
        repositoryHome.fetchCoworkerByemail(context, searchController); */
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
