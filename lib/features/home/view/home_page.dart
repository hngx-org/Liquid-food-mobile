import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/repository/home.repo.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:free_lunch_app/features/home/view_model/home_viewmodel.dart';
import 'package:free_lunch_app/features/login/viewmodels/user.viewmodel.dart';
import 'package:free_lunch_app/features/sendLunches/view/send_lunch.dart';
import 'package:free_lunch_app/utils/res/colors.dart';
import 'package:free_lunch_app/utils/res/icons.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/utils/res/svg_icons.dart';
import 'package:free_lunch_app/utils/res/typography.dart';
import 'package:free_lunch_app/widgets/action_buttons.dart';
import 'package:free_lunch_app/widgets/avatar.dart';
import 'package:free_lunch_app/widgets/custom_text_field.dart';
import 'package:free_lunch_app/widgets/total_card.dart';
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
          .filterCoworkers(context, searchController);
      Provider.of<HomeRepoVM>(context, listen: false).fetchCredit(context);
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
    final userProfile = Provider.of<UserViewModel>(context);
    print("profile ${userProfile.fullName.toString()} ${userProfile.balance}");
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: AppTypography.subTitle3,
                    ),
                    Text(
                      userProfile.fullName.toString(),
                      style: AppTypography.bodyText2,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TotalCardThree(
                text1: 'You’ve done well this month. Cheers 🥂',
                text2: 'Free Lunches',
                totalNum: userProfile.balance.toString(),
                width: width * .942,
                height: height * .110),
            const SizedBox(
              height: 10,
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
                onSubmitted: (value) {
                  searchFocus.unfocus();
                  Provider.of<HomeRepoVM>(context, listen: false)
                      .filterCoworkers(context, searchController);
                }),
            const SizedBox(
              height: 10,
            ),
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
              child: FutureBuilder<List<dynamic>>(
                  future: Provider.of<HomeRepoVM>(context).coworkersList,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      Provider.of<HomeRepoVM>(context)
                          .coworkersList
                          ?.then((value) {
                        if (kDebugMode) {
                          print(value.length);
                        }
                      });
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
                              onTap: () {},
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
                                      children: [
                                        const AvatarComponent(
                                            image: AssetImage(
                                                'assets/images/dp.png'),
                                            width: 40,
                                            height: 40),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '${coWorkerItem!['firstName'].toString()} ${coWorkerItem['lastName'].toString()}',
                                              style: AppTypography.bodyText3,
                                            ),
                                            Text(
                                              coWorkerItem['organizations']
                                                      ['name']
                                                  .toString(),
                                              style: AppTypography.subTitle3,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    MiniActionBtn(
                                      onTap: () {
                                        Utils.mainAppNav.currentState?.push(
                                            MaterialPageRoute(
                                                builder: (_) => SendLunches(
                                                    worker: coWorkerItem,
                                                    totalLunches: context
                                                        .read<HomeRepoVM>()
                                                        .lunchCredit
                                                        .toString())));
                                      },
                                      icon: AppSvgIcons.hamburgerLight,
                                      text: 'Send Lunch',
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
