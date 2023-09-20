import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '/utils/svg_icons.dart';
import '../../presentation/pages/withdraw_account.dart';
import './/withdrawal/presentation/widgets/w_button.dart';
import '../widgets/screen_styles.dart';
import './/utils/colors.dart';
import './/utils/icons.dart';

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
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const WText(
                      text: '12',
                      color: AppColors.tPrimaryColor1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(height: height * 0.002),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'withdrawData.availableAmount',
                            style: GoogleFonts.workSans(
                              color: AppColors.tPrimaryColor1,
                              fontSize: 48,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          WidgetSpan(
                            child: AppSvgIcons.hamburgerLightTotal,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              Container(
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WText(
                          text: 'Total lunch',
                          color: AppColors.tBlack4,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        WText(
                          text: 'x12',
                          color: AppColors.tBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.008),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WText(
                          text: 'Worth',
                          color: AppColors.tBlack4,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        WText(
                          text: '\$120 (\$10 per lunch)',
                          color: AppColors.tBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                  onTap: () => Navigator.pushNamed(
                    context,
                    WithdrawalAccount.routeName,
                  ),
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
