import 'package:flutter/material.dart';

import '../../utils/svg_icons.dart';
import '../../utils/typography.dart';

class CustomTileCard extends StatelessWidget {
  const CustomTileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            'Mark Essien',
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
                  '2 lunches',
                  style: AppTypography.subHeader4,
                )
              ],
            ),
          )),
    );
  }
}
