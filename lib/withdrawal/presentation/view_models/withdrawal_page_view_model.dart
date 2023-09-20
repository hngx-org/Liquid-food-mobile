import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/iwithdrawal_repo.dart';
import '../../data/withdraw_screen_model.dart';

class WithdrawalPageViewModel {
  final Ref ref;
  final IWithdrawalRepo _withdrawalRepo;

  WithdrawalPageViewModel(this._withdrawalRepo, this.ref);
  Future<WithdrawalModel> getWithdrawaData() async {
    var withdrawPageData = await _withdrawalRepo.getWithdrawData();

    return withdrawPageData;
  }
}
