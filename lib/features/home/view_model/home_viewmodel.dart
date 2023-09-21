import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/repository/home.repo.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';

class HomeRepoVM with ChangeNotifier {
  IRepositoryHome repositoryHome = HomeRepository();
  Future<List<CoWorker>>? _coworkersList;
  Future<List<CoWorker>>? get coworkersList => _coworkersList;

  void filterCoworkers(TextEditingController searchController) {
    _coworkersList = repositoryHome.defaultCoworkerItems();
    if (searchController.text.isNotEmpty) {
      _coworkersList = _coworkersList?.then((value) => value
          .where((coworker) => coworker.name!
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList());
      notifyListeners();
    } else {
      _coworkersList;
      notifyListeners();
    }
  }
}
