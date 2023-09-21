import '../withdraw_screen_model.dart';
import './iwithdrawal_repo.dart';

class MockWithdrawRepo implements IWithdrawalRepo {
  @override
  Future<WithdrawalModel> getWithdrawData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return const WithdrawalModel(
        availableLunch: 'Available lunches',
        availableAmount: '12',
        worth: '120',
        perLunch: '10',
      );
    });
  }
}
