import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/repository/home.repo.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:free_lunch_app/features/home/view_model/home_viewmodel.dart';
import 'package:free_lunch_app/utils/res/colors.dart';
import 'package:free_lunch_app/utils/res/icons.dart';
import 'package:free_lunch_app/utils/res/svg_icons.dart';
import 'package:free_lunch_app/widgets/avatar.dart';
import 'package:free_lunch_app/widgets/custom_text_field.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/screen_styles.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 8),
              child: AvatarComponent(
                  image: const AssetImage('assets/images/dp.png'),
                  width: width * .13,
                  height: height * .055),
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
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     AvatarComponent(
            //         image: const AssetImage('assets/images/dp.png'),
            //         width: width * .15,
            //         height: height * .1),
            //     const SizedBox(
            //       width: 12,
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Welcome',
            //           style: AppTypography.subTitle3,
            //         ),
            //         Text(
            //           'Tevin M',
            //           style: AppTypography.bodyText2,
            //         ),
            //       ],
            //     )
            //   ],
            // ),
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
                    text: 'You’ve done well this month. Cheers 🥂',
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
                                        color: AppColors.tBlack4),
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
            SizedBox(height: height * 0.01),
            Expanded(
              child: FutureBuilder<List<CoWorker>>(
                  future: Provider.of<HomeRepoVM>(context).coworkersList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CoWorker>> snapshot) {
                    if (!snapshot.hasData) {
                      return Column(
                        children: [
                          SizedBox(height: height * 0.04),
                          const Text('Loading'),
                          SizedBox(height: height * 0.05),
                          const Center(
                              child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ))
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error occurred');
                    }
                    if (snapshot.data!.isEmpty || snapshot.data == null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final coWorkerItem = snapshot.data?[index];
                          // ignore: prefer_is_empty{
                          return Card(
                            margin: const EdgeInsets.all(10),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            elevation: 0,
                            color: AppColors.searchGray,
                            child: ListTile(
                              minVerticalPadding: 5,
                              horizontalTitleGap: 8,
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              leading: AvatarComponent(
                                  image: AssetImage(
                                      coWorkerItem!.profilePath.toString()),
                                  width: 45,
                                  height: 45),
                              title: WText(
                                text: coWorkerItem.name.toString(),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              subtitle: WText(
                                text: coWorkerItem.designation.toString(),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff737373),
                              ),
                              trailing: SizedBox(
                                width: width * 0.38,
                                height: height * 0.05,
                                child: WButton(
                                  leading: AppSvgIcons.hamburgerLightTotal,
                                  title: 'Send Lunch',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.backgroundColor,
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(12.0),
                            //   child: Row(
                            //       mainAxisAlignment:
                            //           MainAxisAlignment.spaceBetween,
                            //       children: [
                            //         Row(
                            //           mainAxisAlignment:
                            //               MainAxisAlignment.spaceBetween,
                            //           children: [

                            //             const SizedBox(
                            //               width: 10,
                            //             ),

                            //             SizedBox(width: width * 0.16),

                            //           ],
                            //         ),
                            //       ]),
                            //   //
                            //   //       // MiniActionBtn(
                            //   //       //   onTap: () {
                            //   //       //     Utils.mainAppNav.currentState?.push(
                            //   //       //         MaterialPageRoute(
                            //   //       //             builder: (_) => SendLunches(
                            //   //       //                 worker: coWorkerItem,
                            //   //       //                 totalLunches: '12')));
                            //   //       //   },
                            //   //       //   icon: AppSvgIcons.hamburgerLight,
                            //   //       //   text: 'Send Lunch',
                            //   //       // )
                            //   //     ],
                            //   //   ),
                            //   // ),
                            // ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
