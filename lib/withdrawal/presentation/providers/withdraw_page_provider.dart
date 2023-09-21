import 'package:flutter/material.dart';

import '../../models/withdraw_screen_model.dart';

class WithdrawView with ChangeNotifier {
  final String _availableAmount = '12';
  final String _perLunch = '10';
  final String _worth = '120';

  String get avAmount => _availableAmount;
  String get avWorth => _worth;
  String get avpLunch => _perLunch;

  Future avialableData() async {
    final dataStore = WithdrawalModel(
        availableAmount: avAmount, worth: avWorth, perLunch: avpLunch);

    return dataStore;
  }
}
