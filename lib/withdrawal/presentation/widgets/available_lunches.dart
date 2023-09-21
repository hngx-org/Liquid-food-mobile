import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../../../utils/svg_icons.dart';
import '../providers/withdraw_page_provider.dart';
import 'screen_styles.dart';

class AvailableLunches extends StatelessWidget {
  const AvailableLunches({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    //Adding provider to screen
    final avLunch = Provider.of<WithdrawView>(context);

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
                  text: avLunch.avAmount,
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
  }
}
