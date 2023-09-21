import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/colors.dart';
import '../providers/withdraw_page_provider.dart';

class WithdrawalSummary extends StatelessWidget {
  const WithdrawalSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final sumData = Provider.of<WithdrawView>(context);

    return Container(
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
                'x${sumData.avAmount}',
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
                '\$${sumData.avWorth} (\$${sumData.avpLunch} per lunch)',
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
    );
  }
}
