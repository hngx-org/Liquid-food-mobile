import 'package:flutter/material.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';

import 'package:google_fonts/google_fonts.dart';
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '12',
                          style: GoogleFonts.workSans(
                            color: AppColors.tPrimaryColor1,
                            fontSize: 48,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: width * 0.004),
                        const Icon(
                          AppIcons.notification,
                          color: Colors.white,
                        )
                      ],
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
                child: const WButton(
                  title: 'Add your account detials',
                  color: AppColors.backgroundColor,
                ),
              ),
              SizedBox(height: height * 0.25),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.contColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: AppColors.tAmberAccent,
                    ),
                    WText(
                      title:
                          'All withdrawals are the processed within 4 to 6 working days.',
                      color: AppColors.tAmberAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),
              const WButton(
                title: 'Request Withdraw',
                disabled: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
