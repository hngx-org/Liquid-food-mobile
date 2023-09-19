import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';

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
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12.0,
                  ),
                  Text('You have'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Image.asset(
                        'assets/images/burger.png',
                        scale: 0.7,
                      ),
                      Text(
                        '$numberOFl',
                        style: TextStyle(
                            color: AppColors.tPrimaryColor,
                            fontSize: 66,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Text('Free lunches'),
                  SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Lunch Received'),
            Text('Yesterday'),
          ],
        ),
      ),
    );
  }
}
