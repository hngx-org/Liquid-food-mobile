import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../feature/utils/colors.dart';
import '../../../feature/utils/icons.dart';
import '../../presentation/pages/withdraw_account.dart';
import '../widgets/available_lunches.dart';
import '../widgets/withdraw_summary.dart';
import './/withdrawal/presentation/widgets/w_button.dart';
import '../widgets/screen_styles.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            AppIcons.arrowLeft,
          ),
        ),
        title: const WText(
          text: 'Withdrawal',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvailableLunches(),
              SizedBox(height: height * 0.03),
              const WithdrawalSummary(),
              SizedBox(height: height * 0.03),
              const WText(
                text: 'Account information',
                color: AppColors.tBlack5,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: width * 0.65,
                child: WButton(
                  onTap: () =>
                      Navigator.pushNamed(context, '/withdraw-account'),
                  title: 'Add your account detials',
                  color: AppColors.backgroundColor,
                ),
              ),
              SizedBox(height: height * 0.15),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.contColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      IconlyLight.info_circle,
                      color: AppColors.tAmberAccent,
                    ),
                    SizedBox(width: width * .02),
                    const Expanded(
                      child: WText(
                        softWrap: true,
                        text:
                            'All withdrawals are processed within 4 to 6 working days.',
                        color: AppColors.tAmberAccent,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              const WButton(
                leading: Icon(
                  IconlyLight.upload,
                  color: AppColors.backgroundColor,
                ),
                title: 'Request Withdraw',
                disabled: true,
                color: AppColors.tPrimaryColor1,
              )
            ],
          ),
        ),
      ),
    );
    //   },
    // );
  }
}
