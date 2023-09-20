import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/svg_icons.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/app_layout.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import './/withdrawal/presentation/widgets/w_button.dart';
import '../widgets/screen_styles.dart';
import './/utils/colors.dart';
import './/utils/icons.dart';

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
                        text: 'Available lunches',
                        color: AppColors.tPrimaryColor1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(height: height * .002),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '12',
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
                SizedBox(height: height * .03),
                Container(
                  padding: const EdgeInsets.all(24),
                  color: AppColors.searchGray,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Withdraw Summary',
                        style: GoogleFonts.workSans(
                          color: AppColors.tBlack5,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total lunch',
                            style: GoogleFonts.workSans(
                              color: AppColors.tBlack4,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            'x12',
                            style: GoogleFonts.workSans(
                              color: AppColors.tBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.008),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Worth',
                            style: GoogleFonts.workSans(
                              color: AppColors.tBlack4,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '\$120 (\$10 per lunch)',
                            style: GoogleFonts.workSans(
                              color: AppColors.tBlack,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const WText(
                      text: 'Account information',
                      color: AppColors.tBlack5,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Edit',
                            style: GoogleFonts.workSans(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const WidgetSpan(
                            child: Icon(
                              IconlyLight.edit,
                              size: 18,
                              color: AppColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.searchGray,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Transform.scale(
                              scale: width * 0.0017,
                              child: Radio(
                                activeColor: AppColors.primaryColor,
                                value: 0,
                                groupValue: 0,
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 10,
                            child: WText(
                              text: 'Bank transfer',
                              color: Color(0xff000000),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WText(
                            text: 'Bank',
                            color: AppColors.tBlack4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          WText(
                            text: 'GTB',
                            color: AppColors.tBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: height * .005),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WText(
                            text: 'Account name',
                            color: AppColors.tBlack4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          WText(
                            text: 'Samuel Igboji Uche',
                            color: AppColors.tBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.005),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WText(
                            text: 'Account number',
                            color: AppColors.tBlack4,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          WText(
                            text: '*******415',
                            color: AppColors.tBlack,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
