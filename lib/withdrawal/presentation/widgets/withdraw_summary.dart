import 'package:flutter/material.dart';
import 'package:free_lunch_app/withdrawal/models/withdraw_screen_model.dart';
import 'package:free_lunch_app/withdrawal/repositories/mock_repo.dart';
import '../../../feature/utils/colors.dart';
import 'screen_styles.dart';

class WithdrawalSummary extends StatelessWidget {
  const WithdrawalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    IWithdrawalRepo withdrawalRepo = MockWithdrawRepo();
    Future<WithdrawalModel>? sumData = withdrawalRepo.getWithdrawData();

    final height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: sumData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          const CircularProgressIndicator(
            color: AppColors.primaryColor,
          );
        } else if (snapshot.hasError) {
          return const Text('Error Getting Data');
        }
        final wData = snapshot.data;
        return Container(
          padding: const EdgeInsets.all(24),
          color: AppColors.searchGray,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WText(
                text: 'Withdraw Summary',
                color: AppColors.tBlack5,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WText(
                    text: 'Total lunch',
                    color: AppColors.tBlack4,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  WText(
                    text: 'x${wData?.availableAmount}',
                    color: AppColors.tBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
              SizedBox(height: height * 0.008),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const WText(
                    text: 'Worth',
                    color: AppColors.tBlack4,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  WText(
                    text: '\$${wData?.worth} (\$${wData?.perLunch} per lunch)',
                    color: AppColors.tBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
