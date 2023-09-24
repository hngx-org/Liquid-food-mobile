import 'package:flutter/material.dart';
import '../../utils/res/colors.dart';
import 'package:free_lunch_app/utils/res/colors.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import '../../utils/utils/svg_icons.dart';
import '../../utils/utils/typography.dart';
import '../../widgets/action_buttons.dart';

class SendRequestPage extends StatelessWidget {
  const SendRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 192,
                ),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow:  const [
                    BoxShadow(
                      color: AppColors.black6,
                      blurRadius: 16,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                width: double.infinity,
                height: 460,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 84,
                    horizontal: 40,
                  ),
                  child: SizedBox(
                    height: 284,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: AppSvgIcons.lunchSent,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Yay youve\nsent',
                          style: AppTypography.subHeader2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25),
                        Text(
                          '3 Free lunches to FolajomiBello',
                          style: AppTypography.subHeader2Black,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 740,
                ),
                width: double.infinity,
                child: ActionBtn2(
                  onTap: () {
                    Utils.mainAppNav.currentState
                        ?.pushReplacementNamed('/home');
                  },
                  widthM: double.infinity,
                  text: 'Return Home',
                  // onTap: () {
                  //   Navigator.pop(context);
                  // },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}