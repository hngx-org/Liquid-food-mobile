import '../models/withdraw_screen_model.dart';

abstract class IWithdrawalRepo {
  //
  Future<WithdrawalModel> getWithdrawData();
}

class MockWithdrawRepo implements IWithdrawalRepo {
  @override
  Future<WithdrawalModel> getWithdrawData() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return const WithdrawalModel(
          availableAmount: '12',
          worth: '120',
          perLunch: '10',
        );
      },
    );
  }
}
