import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/utils/utils/colors.dart';
import 'package:free_lunch_app/utils/utils/svg_icons.dart';
import 'package:free_lunch_app/utils/utils/typography.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import '../../repo/lunches_repo.dart';
import '../../repo/mock_lunchinfo.dart';
import '../../../widgets/custom_tilecard.dart';
import 'lunches_view_model.dart';

class LunchesView extends StatelessWidget {
  const LunchesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    ILunchRepository lunchRepository = MockLunchRepository();
    final lunchInfo = lunchRepository.getLunchInfo();
    LunchesViewModel lunchesViewModel = context.watch<LunchesViewModel>();
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
                    children: [
                      AppSvgIcons.hamburgerPrimary,
                      Text('${lunchesViewModel.numberOFl}',
                          style: AppTypography.title3)
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
                  itemCount: lunchInfo.length,
                  itemBuilder: (context, index) =>
                      CustomTileCard(lunchInfo: lunchInfo[index])),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Utils.mainAppNav.currentState?.pushNamed('/withdrawal');
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.tPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            maximumSize: const Size(156, 56)),
        child: Row(
          children: [
            const Icon(
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
