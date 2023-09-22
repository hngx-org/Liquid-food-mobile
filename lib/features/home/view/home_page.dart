import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/repository/home.repo.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:free_lunch_app/features/home/view_model/home_viewmodel.dart';
import 'package:free_lunch_app/features/sendLunches/view/send_lunch.dart';
import 'package:free_lunch_app/utils/res/colors.dart';
import 'package:free_lunch_app/utils/res/icons.dart';
import 'package:free_lunch_app/feature/utils/routing/utlils.dart';
import 'package:free_lunch_app/utils/res/svg_icons.dart';
import 'package:free_lunch_app/utils/res/typography.dart';
import 'package:free_lunch_app/widgets/action_buttons.dart';
import 'package:free_lunch_app/widgets/avatar.dart';
import 'package:free_lunch_app/widgets/custom_text_field.dart';
import 'package:free_lunch_app/widgets/total_card.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/screen_styles.dart';
import 'package:free_lunch_app/withdrawal/presentation/widgets/w_button.dart';
import 'package:google_fonts/google_fonts.dart';
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: AvatarComponent(
              image: const AssetImage('assets/images/dp.png'),
              width: width * .15,
              height: height * .1),
        ),
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WText(
              text: 'Welcome',
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
            WText(
              text: 'Tevin M.',
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.024, vertical: 4),
        child: Column(
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
                          Center(child: AppSvgIcons.hamburgerPrimary2),
                          SizedBox(width: width * 0.009),
                          const WText(
                            text: '12',
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
                leadingIcon: const Icon(AppIcons.search),
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
            SizedBox(height: height * 0.05),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Co-workers',
                style: AppTypography.subHeader2,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: FutureBuilder<List<CoWorker>>(
                  future: Provider.of<HomeRepoVM>(context).coworkersList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CoWorker>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Column(
                        children: [
                          Text('Loading'),
                          Center(child: CircularProgressIndicator())
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Error occurred');
                    }
                    if (snapshot.data!.isEmpty || snapshot.data == null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                '🤔',
                                style: AppTypography.header3,
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "You haven't invited any \nco-worker",
                            textAlign: TextAlign.center,
                            style: AppTypography.subHeader1,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ActionBtn(
                              widthM: MediaQuery.sizeOf(context).width * .8,
                              text: 'Invite co-worker'),
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
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            elevation: 5,
                            color: AppColors.searchGray,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AvatarComponent(
                                            image: AssetImage(coWorkerItem!
                                                .profilePath
                                                .toString()),
                                            width: 40,
                                            height: 40),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              coWorkerItem.name.toString(),
                                              style: AppTypography.bodyText3,
                                            ),
                                            Text(
                                              coWorkerItem.designation
                                                  .toString(),
                                              style: AppTypography.subTitle3,
                                            )
                                          ],
                                        ),
                                        SizedBox(width: width * 0.16),
                                        SizedBox(
                                            width: width * 0.4,
                                            child: WButton(
                                              leading: AppSvgIcons
                                                  .hamburgerLightTotal,
                                              title: 'Send Lunch',
                                              color: AppColors.backgroundColor,
                                            ))
                                      ],
                                    ),
                                  ]),
                              //
                              //       // MiniActionBtn(
                              //       //   onTap: () {
                              //       //     Utils.mainAppNav.currentState?.push(
                              //       //         MaterialPageRoute(
                              //       //             builder: (_) => SendLunches(
                              //       //                 worker: coWorkerItem,
                              //       //                 totalLunches: '12')));
                              //       //   },
                              //       //   icon: AppSvgIcons.hamburgerLight,
                              //       //   text: 'Send Lunch',
                              //       // )
                              //     ],
                              //   ),
                              // ),
                            ),
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
