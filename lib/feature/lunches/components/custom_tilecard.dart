import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/models/lunch_model.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view_model.dart';
import 'package:free_lunch_app/feature/repo/lunches_repo.dart';
import 'package:free_lunch_app/feature/repo/mock_lunchinfo.dart';
import 'package:provider/provider.dart';

import '../../utils/svg_icons.dart';
import '../../utils/typography.dart';

class CustomTileCard extends StatelessWidget {
  const CustomTileCard({super.key, required this.lunchInfo});

  final LunchInfo lunchInfo;

  @override
  Widget build(BuildContext context) {
    return Consumer<LunchesViewModel>(builder: (context, lunchInfoT, child) {
      return Card(
        child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: SizedBox.fromSize(
                  size: Size.fromRadius(25),
                  child: Image.asset(
                    'assets/images/christian-buehner.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
            title: Text(
              '${lunchInfoT}Mark Essien',
              style: AppTypography.subHeader4,
            ),
            subtitle: Text(
              'CTO',
              style: AppTypography.subHeader3,
            ),
            trailing: Container(
              width: 90,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppSvgIcons.hamburgerDark,
                  Text(
                    'lunches',
                    style: AppTypography.subHeader4,
                  )
                ],
              ),
            )),
      );
    });
  }
}
