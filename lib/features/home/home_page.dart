import 'package:flutter/material.dart';
import '../../utils/icons.dart';
import '../../utils/typography.dart';
import '../../widgets/avatar.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/total_card.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  late FocusNode searchFocus;

  @override
  void initState() {
    searchController = TextEditingController();
    searchFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AvatarComponent(
                    image: const AssetImage('assets/images/dp.png'),
                    width: width * .15,
                    height: height * .1),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: AppTypography.subTitle3,
                    ),
                    Text(
                      'Tevin M',
                      style: AppTypography.bodyText2,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: height * .05,
            ),
            TotalCardTwo(
                totalNum: '10', width: width * .942, height: height * .110),
            SizedBox(
              height: height * .012,
            ),
            CustomTextField(
                textController: searchController,
                textFocus: searchFocus,
                isPassword: false,
                leadingIcon: const Icon(AppIcons.search),
                hintText: 'Search for co-workers',
                validator: (value) {
                  return null;
                },
                isMultiLine: false,
                onSubmitted: (value) {}),
            ListView.builder(
              itemBuilder: (context, i) {
                return ListTile(
                  leading: AvatarComponent(
                      image: const AssetImage('assets/images/dp.png'),
                      width: width * .15,
                      height: height * .1),
                  title: const Text('Tevin M'),
                  subtitle: const Text('Product Designer'),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
