import 'package:flutter/material.dart';

abstract class IRepositoryHome {
  Future<List<dynamic>> fetchCoworkerItems(
      BuildContext context, TextEditingController searchController);
}
