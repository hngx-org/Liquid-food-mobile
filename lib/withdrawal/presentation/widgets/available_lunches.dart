import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';
import '../../../utils/svg_icons.dart';
import '../../models/withdraw_screen_model.dart';
import '../../repositories/mock_repo.dart';
import 'screen_styles.dart';

class AvailableLunches extends StatelessWidget {
  const AvailableLunches({super.key});

  @override
  Widget build(BuildContext context) {
    IWithdrawalRepo withdrawalRepo = MockWithdrawRepo();
    Future<WithdrawalModel>? avmData = withdrawalRepo.getWithdrawData();

    final height = MediaQuery.of(context).size.height;

    return FutureBuilder(
      future: avmData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          const CircularProgressIndicator(
            color: AppColors.primaryColor,
          );
        } else if (snapshot.hasError) {
          return const Text('No Lunch Available');
        }
        final avData = snapshot.data;
        return Container(
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
                      text: avData?.availableAmount,
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
        );
      },
    );
  }
}
