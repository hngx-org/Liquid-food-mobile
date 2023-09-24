import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../utils/utils/colors.dart';
import '../../../utils/utils/icons.dart';
import '../widgets/acct_info.dart';
import '../widgets/app_layout.dart';
import '../widgets/available_lunches.dart';
import '../widgets/withdraw_summary.dart';
import './/withdrawal/presentation/widgets/w_button.dart';
import '../widgets/screen_styles.dart';

class WithdrawalAccount extends StatefulWidget {
  const WithdrawalAccount({super.key});

  static const routeName = '/withdraw-account';

  @override
  State<WithdrawalAccount> createState() => _WithdrawalAccountState();
}

class _WithdrawalAccountState extends State<WithdrawalAccount> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
      body: ScreenLayout(
        mobile: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AvailableLunches(),
                SizedBox(height: height * .03),
                const WithdrawalSummary(),
                SizedBox(height: height * 0.03),
                const AccountInfo(),
                SizedBox(height: height * 0.015),
                GestureDetector(
                  onTap: () {},
                  child: const WText(
                    text: 'Not your account information?',
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: height * 0.04),
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
                              'All withdrawals are the processed within 4 to 6 working days.',
                          color: AppColors.tAmberAccent,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.07),
                const WButton(
                  leading: Icon(
                    IconlyLight.upload,
                    color: AppColors.backgroundColor,
                  ),
                  title: 'Request Withdraw',
                  color: AppColors.tPrimaryColor1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
