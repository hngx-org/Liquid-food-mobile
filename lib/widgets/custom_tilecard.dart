import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/lunches/models/lunch_model.dart';
import 'package:free_lunch_app/feature/lunches/presentation/lunches_view_model.dart';
import 'package:provider/provider.dart';
import '../feature/utils/svg_icons.dart';
import '../feature/utils/typography.dart';

class CustomTileCard extends StatelessWidget {
  const CustomTileCard({super.key, required this.lunchInfo});

  final LunchInfo lunchInfo;

  @override
  Widget build(BuildContext context) {
    return Consumer<LunchesViewModel>(builder: (context, lunchinfo, child) {
      return Card(
        child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: SizedBox.fromSize(
                  size: const Size.fromRadius(25),
                  child: Image.asset(
                    lunchInfo.image,
                    fit: BoxFit.cover,
                  )),
            ),
            title: Text(
              lunchInfo.fullName,
              style: AppTypography.subHeader4,
            ),
            subtitle: Text(
              lunchInfo.role,
              style: AppTypography.subHeader3,
            ),
            trailing: SizedBox(
              width: 90,
              height: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppSvgIcons.hamburgerDark,
                  Text(
                    '${lunchInfo.lunchReceived} lunches',
                    style: AppTypography.subHeader4,
                  )
                ],
              ),
            )),
      );
    });
  }
}
