import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/home/models/co_worker.model.dart';
import 'package:free_lunch_app/features/sendLunches/viewmodel/sendlunch.viewmodel.dart';
import 'package:free_lunch_app/utils/res/icons.dart';
import 'package:free_lunch_app/utils/res/svg_icons.dart';
import 'package:free_lunch_app/utils/res/typography.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/utils/widgets/action_buttons.dart';
import 'package:free_lunch_app/utils/widgets/avatar.dart';
import 'package:free_lunch_app/utils/widgets/comment_widget.dart';
import 'package:free_lunch_app/utils/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class SendLunches extends StatelessWidget {
  final CoWorker worker;
  final String totalLunches;
  const SendLunches(
      {super.key, required this.worker, required this.totalLunches});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Send lunch',
          style: AppTypography.subHeader2,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Utils.mainAppNav.currentState?.pop();
            },
            icon: const Icon(AppIcons.arrowLeft)),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  AvatarComponent(
                      image: AssetImage(worker.profilePath!),
                      width: MediaQuery.sizeOf(context).width * .4,
                      height: MediaQuery.sizeOf(context).height * .25),
                  Text(
                    worker.name!,
                    style: AppTypography.subHeader1black,
                  ),
                  Text(
                    worker.designation!,
                    style: AppTypography.bodyText3,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Select the amount of free lunch',
                style: AppTypography.bodyText3,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      4,
                      (index) => InkWell(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            onTap: () {
                              final lunch = Provider.of<SendLunchVM>(context,
                                  listen: false);
                              lunch.setLunchCount(index + 1);
                            },
                            child: CustomCard(
                                selected: Provider.of<SendLunchVM>(context)
                                        .lunchCount ==
                                    index + 1,
                                cardText: (index + 1).toString(),
                                icon: AppSvgIcons.hamburgerDark),
                          )),
                ),
              ),
              RichText(
                text: TextSpan(
                    text: 'Lunch Balance',
                    style: AppTypography.bodyText3,
                    children: [
                      TextSpan(
                          text: totalLunches,
                          style: AppTypography.subHeader3Size12)
                    ]),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .08,
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '  Say something nice (optional)',
                    style: AppTypography.bodyText3,
                  )),
              const SizedBox(
                height: 5,
              ),
              const CommentWidget(initialCommentText: ''),
              SizedBox(
                height: height * .04,
              ),
              ActionBtn(
                widthM: width * .9,
                text: 'Send Lunch',
                icon: AppSvgIcons.hamburgerLight,
              )
            ],
          ),
        ),
      )),
    );
  }
}
