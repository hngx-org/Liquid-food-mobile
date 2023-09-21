import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view_model.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/feature/utils/svg_icons.dart';
import 'package:free_lunch_app/feature/utils/typography.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../repo/lunches_repo.dart';
import '../../repo/mock_lunchinfo.dart';
import '../components/custom_tilecard.dart';

class LunchesView extends StatelessWidget {
  LunchesView({
    super.key,
  });
  int numberOFl = 12;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    ILunchRepository lunchRepository = MockLunchRepository();
    final lunchInfoT = lunchRepository.getLunchInfo();
    // LunchesViewModel lunchesViewModel = context.watch<LunchesViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lunches',
          style: AppTypography.title1,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.024),
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
                    height: height * 0.03,
                  ),
                  Text(
                    'You have',
                    style: AppTypography.subHeader4,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // textBaseline: TextBaseline.alphabetic,
                    children: [
                      AppSvgIcons.hamburgerPrimary,
                      Text('$numberOFl', style: AppTypography.title3)
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    'Free Lunches',
                    style: AppTypography.subHeader4,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Lunch Received',
              style: AppTypography.subHeader4,
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              'Yesterday',
              style: AppTypography.subHeader3,
            ),
            Expanded(
              child: ListView.builder(
                  // shrinkWrap: true,
                  itemCount: lunchInfoT.length,
                  itemBuilder: (context, index) =>
                      CustomTileCard(lunchInfo: lunchInfoT[index])),
            )
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
              IconlyLight.upload,
              color: AppColors.tPrimaryColor1,
            ),
            SizedBox(
              width: width * 0.010,
            ),
            Text('Withdraw', style: AppTypography.smallButtonText)
          ],
        ),
      ),
    );
  }
}
