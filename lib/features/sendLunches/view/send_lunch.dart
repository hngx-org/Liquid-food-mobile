import 'package:flutter/material.dart';
import 'package:free_lunch_app/features/sendLunches/models/sendlunch.model.dart';
import 'package:free_lunch_app/features/sendLunches/viewmodel/sendlunch.viewmodel.dart';
import 'package:free_lunch_app/utils/res/icons.dart';
import 'package:free_lunch_app/utils/res/svg_icons.dart';
import 'package:free_lunch_app/utils/res/typography.dart';
import 'package:free_lunch_app/utils/routing/utlils.dart';
import 'package:free_lunch_app/widgets/action_buttons.dart';
import 'package:free_lunch_app/widgets/avatar.dart';
import 'package:free_lunch_app/widgets/comment_widget.dart';
import 'package:free_lunch_app/widgets/custom_card.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendLunches extends StatefulWidget {
  final dynamic worker;
  final String totalLunches;
  const SendLunches(
      {super.key, required this.worker, required this.totalLunches});

  @override
  State<SendLunches> createState() => _SendLunchesState();
}

class _SendLunchesState extends State<SendLunches> {
  late TextEditingController commentCont;

  @override
  void initState() {
    commentCont = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    commentCont.dispose();
    super.dispose();
  }

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
          child: ModalProgressHUD(
        inAsyncCall: context.read<SendLunchVM>().isLoading,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    AvatarComponent(
                        image: const AssetImage('assets/images/dp.png'),
                        width: MediaQuery.sizeOf(context).width * .25,
                        height: MediaQuery.sizeOf(context).height * .15),
                    Text(
                      '${widget.worker['firstName'].toString()} ${widget.worker['lastName'].toString()}',
                      style: AppTypography.subHeader1black,
                    ),
                    Text(
                      widget.worker['organizations']['name'].toString(),
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
                            text: widget.totalLunches,
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
                CommentWidget(
                    commentController: commentCont, initialCommentText: ''),
                SizedBox(
                  height: height * .04,
                ),
                ActionBtn(
                  onTap: () async {
                    if (!context.mounted) {
                      return;
                    }
                    final lunch = context.read<SendLunchVM>();
                    SendLunchItem sendLunchItem = SendLunchItem(
                        lunchCount: lunch.lunchCount,
                        id: widget.worker['id'].toString(),
                        message: commentCont.text.toString());
                    final sendLunch =
                        Provider.of<SendLunchVM>(context, listen: false);

                    if (!sendLunch.isLoading) {
                      await sendLunch.sendLunch(context, sendLunchItem);
                      final name =
                          '${widget.worker['firstName'].toString()} ${widget.worker['lastName'].toString()}';
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();
                      await sp.setInt('lunch', lunch.lunchCount);
                      await sp.setString('name', name);
                    }
                  },
                  widthM: width * .9,
                  text: 'Send Lunch',
                  icon: AppSvgIcons.hamburgerLight,
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
