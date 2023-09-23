import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../feature/utils/colors.dart';
import 'screen_styles.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
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
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/add-account');
                      },
                      child: Icon(
                        IconlyLight.edit,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
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
      ],
    );
  }
}
