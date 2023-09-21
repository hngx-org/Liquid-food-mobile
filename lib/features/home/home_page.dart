import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/home/repository/home.repo.dart';
import 'package:free_lunch_app/features/home/repository/irepository.home.dart';
import 'package:free_lunch_app/features/lunches/send_lunch.dart';
import 'package:free_lunch_app/utils/colors.dart';
import 'package:free_lunch_app/utils/icons.dart';
import 'package:free_lunch_app/utils/svg_icons.dart';
import 'package:free_lunch_app/utils/typography.dart';
import 'package:free_lunch_app/utils/widgets/action_buttons.dart';
import 'package:free_lunch_app/utils/widgets/avatar.dart';
import 'package:free_lunch_app/utils/widgets/custom_text_field.dart';
import 'package:free_lunch_app/utils/widgets/total_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  late FocusNode searchFocus;

  IRepositoryHome homeRepo = HomeRepository();
  Future<List<CoWorker>>? coworkersList;

  @override
  void initState() {
    coworkersList = homeRepo.defaultCoworkerItems();
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
                      'Tevin M',
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
                totalNum: '10', width: width * .942, height: height * .110),
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
                onSubmitted: (value) {}),
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
              child: FutureBuilder<List<CoWorker>>(
                  future: coworkersList,
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
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final coWorkerItem = snapshot.data?[index];
                          if (snapshot.data!.isNotEmpty) {
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
                                      ],
                                    ),
                                    MiniActionBtn(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SendLunches()),
                                        );
                                      },
                                      icon: AppSvgIcons.hamburgerLight,
                                      text: 'Send Lunch',
                                    )
                                  ],
                                ),
                              ),
                            );
                          } else {
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
                                    widthM:
                                        MediaQuery.sizeOf(context).width * .8,
                                    text: 'Invite co-worker'),
                              ],
                            );
                          }
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
