import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/mock_withdrawal.dart';
import '../../presentation/view_models/withdrawal_page_view_model.dart';
import '../../data/repositories/iwithdrawal_repo.dart';

final withdrawRepoProvider = Provider<IWithdrawalRepo>(
  (ref) => MockWithdrawRepo(),
);

//Provider for wrapping viewModel
final withdrawViewProvider = Provider<WithdrawalPageViewModel>(
  (ref) {
    var repository = ref.read(withdrawRepoProvider);
    return WithdrawalPageViewModel(repository, ref);
  },
);

//Future Provider to get withdrawPage data
final withdrawProvider = FutureProvider((ref) {
  final withdrawVM = ref.read(withdrawViewProvider);

  return withdrawVM.getWithdrawaData();
});
