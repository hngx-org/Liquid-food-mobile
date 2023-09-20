import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import './/withdrawal/presentation/widgets/w_button.dart';
import '../widgets/screen_styles.dart';
import './/utils/colors.dart';
import './/utils/icons.dart';

class WithdrawalAccount extends StatelessWidget {
  const WithdrawalAccount({super.key});

  static const routeName = '/withdraw-account';

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
        title: Text(
          'Withdrawal',
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
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
                    Text(
                      'Available lunches',
                      style: GoogleFonts.workSans(
                        color: AppColors.tPrimaryColor1,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: height * 0.002),
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
                    SizedBox(width: width * 0.01),
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
              Text(
                'Account information',
                style: GoogleFonts.workSans(
                  color: AppColors.tBlack5,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: width * 0.65,
                child: WButton(
                  onTap: () {},
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
                        title:
                            'All withdrawals are the processed within 4 to 6 working days.',
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
  }
}
