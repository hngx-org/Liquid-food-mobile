import 'package:flutter/material.dart';
import 'package:free_lunch_app/utils/res/colors.dart';
import 'package:free_lunch_app/utils/res/svg_icons.dart';
import 'package:free_lunch_app/utils/res/typography.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/widgets/action_buttons.dart';

class LunchSent extends StatelessWidget {
  final int lunchCount;
  final String recieverName;
  const LunchSent(
      {super.key, required this.lunchCount, required this.recieverName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 70),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppSvgIcons.lunchSent,
                      const SizedBox(
                        height: 25,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 'Yay! you\'ve sent\n',
                            style: AppTypography.subHeader1,
                            children: [
                              TextSpan(
                                  text: '$lunchCount free lunches\n',
                                  style: AppTypography.subHeader1black),
                              TextSpan(
                                  text: 'to $recieverName',
                                  style: AppTypography.subHeader1black)
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ActionBtn(
                text: 'Return Home',
                onTap: () {
                  Utils.mainAppNav.currentState?.pushReplacementNamed('/home');
                })
          ],
        ),
      ),
    );
  }
}
