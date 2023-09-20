import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/feature/utils/svg_icons.dart';

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
              // margin: EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 12.0,
                  ),
                  Text('You have'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      AppSvgIcons.hamburgerPrimary,
                      Text(
                        '$numberOFl',
                        style: TextStyle(
                            fontFamily: 'WorkSans',
                            color: AppColors.tPrimaryColor,
                            fontSize: 66,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Text(
                    'Free Lunches',
                    style: TextStyle(fontFamily: 'WorkSans'),
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
            Text('Lunch Received'),
            SizedBox(
              height: 10.0,
            ),
            Text('Yesterday'),
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
            Text(
              'Withdraw',
              style: TextStyle(
                  fontFamily: 'WorkSans', color: AppColors.tPrimaryColor1),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: AppSvgIcons.home, label: '.'),
          BottomNavigationBarItem(icon: AppSvgIcons.hamburgerDark, label: '.'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: '.')
        ],
      ),
    );
  }
}

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
          title: Text('Mark Essien'),
          subtitle: Text('CTO'),
          trailing: Container(
            width: 60,
            height: 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AppSvgIcons.hamburgerDark, Text('2 lunches')],
            ),
          )),
    );
  }
}
