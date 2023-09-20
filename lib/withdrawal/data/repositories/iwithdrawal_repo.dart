import '../withdraw_screen_model.dart';

abstract class IWithdrawalRepo {
  //
  Future<WithdrawalModel> getWithdrawData();
}
