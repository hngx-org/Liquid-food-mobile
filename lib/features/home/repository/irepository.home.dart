import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/models/search_by_email.model.dart';

abstract class IRepositoryHome {
  Future<List<CoWorker>> fetchCoworkerItems(
      BuildContext context, TextEditingController searchController);
  Future<List<UserbyEmail>> fetchCoworkerByemail(
      BuildContext context, TextEditingController searchController);
}
