import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/feature/utils/svg_icons.dart';
import 'package:free_lunch_app/feature/utils/typography.dart';

import '../components/custom_tilecard.dart';

class LunchesView extends StatelessWidget {
  LunchesView({
    super.key,
  });

  int numberOFl = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lunches',
          style: AppTypography.title1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              // margin: EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'You have',
                    style: AppTypography.subHeader4,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      AppSvgIcons.hamburgerPrimary,
                      Text('$numberOFl', style: AppTypography.title3)
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Free Lunches',
                    style: AppTypography.subHeader4,
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Lunch Received',
              style: AppTypography.subHeader4,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Yesterday',
              style: AppTypography.subHeader3,
            ),
            CustomTileCard(),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.tPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            maximumSize: Size(156, 56)),
        child: Row(
          children: [
            Icon(
              Icons.present_to_all,
              color: AppColors.tPrimaryColor1,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Withdraw', style: AppTypography.smallButtonText)
          ],
        ),
      ),
    );
  }
}
