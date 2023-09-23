import 'package:flutter/material.dart';
import 'package:free_lunch_app/feature/utils/colors.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/screen_styles.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
import 'package:provider/provider.dart';

import '../../../feature/utils/icons.dart';
import '../../../utils/res/svg_icons.dart';
import '../../../utils/res/typography.dart';
import '../../../widgets/action_buttons.dart';
import '../../../widgets/avatar.dart';
import '../../../widgets/custom_text_field.dart';
import '../repository/home.repo.dart';
import '../repository/irepository.home.dart';
import '../view_model/home_viewmodel.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  late TextEditingController searchController = TextEditingController();
  late FocusNode searchFocus;

  IRepositoryHome homeRepo = HomeRepository();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeRepoVM>(context, listen: false)
          .filterCoworkers(searchController);
    });
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

  final int length = 10;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  AvatarComponent(
                      image: const AssetImage('assets/images/dp.png'),
                      width: width * .13,
                      height: height * .055),
                  Positioned(
                    left: width * 0.099,
                    top: height * 0.00009,
                    child: Container(
                      width: 15,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.backgroundColor),
                      child: const Icon(
                        Icons.verified,
                        size: 15,
                        color: AppColors.tAmberAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WText(
                  text: 'Welcome',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
                WText(
                  text: 'Samuel I.',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )
          ],
        ),
        elevation: 0,
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            Container(
              width: double.infinity,
              height: height * 0.16,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  color: const Color(0xffCCE7FF),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const WText(
                    text: 'You’ve',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Container(
                    width: width * 0.4,
                    height: height * 0.07,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 0.3,
                                        spreadRadius: 0.2,
                                        offset: Offset(0.2, 0.2),
                                        color: AppColors.tBlack5)
                                  ],
                                  color: AppColors.backgroundColor,
                                  shape: BoxShape.circle),
                              child: AppSvgIcons.hamburgerPrimary2),
                          SizedBox(width: width * 0.02),
                          const WText(
                            text: '500',
                            color: AppColors.tAmberAccent,
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.009),
                  const WText(
                    text: 'Freee Lunches',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
            CustomTextField(
                textController: searchController,
                textFocus: searchFocus,
                isPassword: false,
                leadingIcon: const Icon(
                  AppIcons.search,
                  size: 18,
                  color: AppColors.tBlack4,
                ),
                hintText: 'Search for co-workers',
                validator: (value) {
                  return null;
                },
                isMultiLine: false,
                onSubmitted: (value) {
                  searchFocus.unfocus();
                  Provider.of<HomeRepoVM>(context, listen: false)
                      .filterCoworkers(searchController);
                }),
            SizedBox(height: height * 0.04),
            const WText(
              text: 'Co-workers',
              fontSize: 16,
              color: AppColors.tBlack,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: height * 0.04),
            const Center(
              child: WText(
                text: '🤔',
                fontSize: 40,
              ),
            ),
            SizedBox(height: height * 0.035),
            const Center(
              child: WText(
                text: 'You haven\'t invited\nany co-worker',
                textAlign: TextAlign.center,
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: AppColors.tShadeColor,
              ),
            ),
            SizedBox(height: height * 0.045),
            WButton(
              onTap: () {},
              title: 'Invite co-worker',
              color: AppColors.backgroundColor,
            ),
          ],
        ),
      ),
    );
  }
}
