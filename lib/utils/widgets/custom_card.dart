import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/res/colors.dart';

class CustomCard extends StatelessWidget {
  final bool? selected;
  final String cardText;
  final Widget icon;
  final double? iconWidth;
  final double? iconHeight;
  const CustomCard(
      {super.key,
      required this.cardText,
      required this.icon,
      this.iconWidth,
      this.iconHeight,
      this.selected});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
          border: selected! ? Border.all(color: AppColors.primaryColor) : null,
          color: selected!
              ? AppColors.primaryColor.withOpacity(0.2)
              : AppColors.tGray.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: <Widget>[
            Text(
              cardText,
              style: TextStyle(
                color: AppColors.tBlack,
                fontSize: width * .01 + 16,
              ),
            ),
            SizedBox(width: width * .01),
            SizedBox(
              width: iconWidth ?? 18,
              height: iconWidth ?? 18,
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
