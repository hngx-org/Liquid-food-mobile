import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
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
        padding: const EdgeInsets.all(24.0),
        child: Column(
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
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              padding: const EdgeInsets.all(24),
              color: AppColors.searchGray,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Withdraw Summary',
                    style: GoogleFonts.workSans(
                      color: AppColors.tGray,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: height * 0.002),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total lunch',
                        style: GoogleFonts.workSans(
                          color: AppColors.tGray,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Worth',
                        style: GoogleFonts.workSans(
                          color: AppColors.tGray,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
