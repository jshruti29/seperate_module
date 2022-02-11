// import 'package:career_lift_mobile_app/common/navigator_class/navigator_class.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
// import 'package:career_lift_mobile_app/common/resources/style/app_text_style.dart';
// import 'package:career_lift_mobile_app/common/resources/style/decoration.dart';
// import 'package:career_lift_mobile_app/common/utilities/internet_util.dart';
// import 'package:career_lift_mobile_app/common/utilities/util.dart';
// import 'package:career_lift_mobile_app/common/widgets/alert_dialog.dart';
// import 'package:career_lift_mobile_app/common/widgets/text_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';
import 'package:quiz/common/Resources/strings/value_string.dart';
import 'package:quiz/common/Resources/style/app_text_style.dart';
import 'package:quiz/common/Resources/style/decoration.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
import 'package:quiz/common/utilities/internet_util.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:quiz/common/widgets/alert_dialog.dart';
import 'package:quiz/common/widgets/text_button_widget.dart';

class CommonExamInstructionScreen extends StatefulWidget {
  final int id;
  final bool isQuiz;
  final String totalTime;
  final String heading;
  final String title;
  final String totalQues;
  final String testHash;
  final String correctMarks;
  final String incorrectMarks;
  final bool isAttempted;

  const CommonExamInstructionScreen({
    Key? key,
    required this.isQuiz,
    required this.id,
    required this.correctMarks,
    required this.totalQues,
    required this.heading,
    required this.incorrectMarks,
    required this.testHash,
    required this.title,
    required this.totalTime,
    required this.isAttempted,
  }) : super(key: key);

  @override
  _CommonExamInstructionScreenState createState() =>
      _CommonExamInstructionScreenState();
}

class _CommonExamInstructionScreenState
    extends State<CommonExamInstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(buildWidth(context) * 0.02),
        child: Card(
          elevation: 10,
          shape: Shape.rectangleBorder10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: buildWidth(context) * 0.02,
                      left: buildWidth(context) * 0.02,
                      right: buildWidth(context) * 0.02),
                  child: ListTile(
                      title: Text(
                    widget.heading,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  )),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: buildWidth(context) * 0.02,
                      left: buildWidth(context) * 0.02,
                      right: buildWidth(context) * 0.02),
                  child: ListTile(
                    title: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.query_builder),
                          Text(
                            widget.totalTime + ' Minutes',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 30),
                          Icon(CupertinoIcons.question_circle),
                          Text(
                            widget.totalQues + ' Questions',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          )
                        ]),
                  ),
                ),
              ),
              PaddingRowWidget(
                  padding: buildWidth(context) * 0.01,
                  rowPadding: buildWidth(context) * 0.02,
                  icon: Icons.keyboard_arrow_right,
                  iconColor: ColorsUtility.primaryColor,
                  text: ValueString.theClockHasSet),
              PaddingRowWidget(
                  padding: buildWidth(context) * 0.01,
                  rowPadding: buildWidth(context) * 0.02,
                  icon: Icons.keyboard_arrow_right,
                  iconColor: ColorsUtility.primaryColor,
                  text: ValueString.tellsRemainingTime),
              PaddingRowWidget(
                  padding: buildWidth(context) * 0.01,
                  rowPadding: buildWidth(context) * 0.02,
                  icon: Icons.keyboard_arrow_right,
                  iconColor: ColorsUtility.primaryColor,
                  text: ValueString.navigateThroughQuestions),
              PaddingRowWidget(
                  padding: buildWidth(context) * 0.01,
                  rowPadding: buildWidth(context) * 0.02,
                  icon: Icons.keyboard_arrow_right,
                  iconColor: ColorsUtility.primaryColor,
                  text: ValueString.selectYourChoice),
              PaddingRowWidget(
                  padding: buildWidth(context) * 0.01,
                  rowPadding: buildWidth(context) * 0.02,
                  icon: Icons.keyboard_arrow_right,
                  iconColor: ColorsUtility.primaryColor,
                  text: 'For each right answer ' +
                      '${widget.correctMarks}' +
                      ' marks will be provided.'),
              PaddingRowWidget(
                  padding: buildWidth(context) * 0.01,
                  rowPadding: buildWidth(context) * 0.02,
                  icon: Icons.keyboard_arrow_right,
                  iconColor: ColorsUtility.primaryColor,
                  text: 'For each wrong answer ' +
                      '${widget.incorrectMarks}' +
                      ' marks will be deducted.'),
              PaddingRowWidget(
                  padding: buildWidth(context) * 0.01,
                  rowPadding: buildWidth(context) * 0.02,
                  icon: Icons.keyboard_arrow_right,
                  iconColor: ColorsUtility.primaryColor,
                  text: ValueString.examTimeout),
              widget.isQuiz
                  ? ListTile(
                      leading: Material(
                        elevation: 5,
                        color: ColorsUtility.green,
                        shape: Shape.rectangleBorder10,
                        child: CircleAvatar(
                          backgroundColor: ColorsUtility.green,
                        ),
                      ),
                      title: Text(ValueString.correctAnswer),
                    )
                  : ListTile(
                      leading: Material(
                        elevation: 5,
                        color: ColorsUtility.greenAccent,
                        shape: Shape.rectangleBorder10,
                        child: CircleAvatar(
                          backgroundColor: ColorsUtility.greenAccent,
                        ),
                      ),
                      title: Text(ValueString.attempted),
                    ),
              widget.isQuiz
                  ? ListTile(
                      leading: Material(
                        elevation: 5,
                        color: ColorsUtility.red,
                        shape: Shape.rectangleBorder10,
                        child: CircleAvatar(
                          backgroundColor: ColorsUtility.red,
                        ),
                      ),
                      title: Text(ValueString.incorrectAnswer),
                    )
                  : ListTile(
                      leading: Material(
                        elevation: 5,
                        color: ColorsUtility.white,
                        shape: Shape.rectangleBorder10,
                        child: CircleAvatar(
                          backgroundColor: ColorsUtility.white,
                        ),
                      ),
                      title: Text(ValueString.notAttempted),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextButtonWidget(
                    buttonTitle: ValueString.startTest,
                    onButtonPressed: () {
                      InternetUtil.isInternetAvailable((status) async {
                        if (status) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertBox(
                                  text: ValueString.yesIAgree,
                                  secondText: ValueString.noGoBack,
                                  title: ValueString.startTest,
                                  content: widget.isAttempted
                                      ? ValueString.examsAlreadyAttempted
                                      : ValueString.readTermsAndConditions,
                                  press: () async {
                                    Navigator.pop(context);
                                    widget.isQuiz
                                        ? NavigatorClass()
                                            .navigateToQuizAllQuestionsScreen(
                                                context,
                                                widget.id,
                                                widget.correctMarks,
                                                widget.incorrectMarks,
                                                widget.totalQues,
                                                widget.heading,
                                                widget.testHash,
                                                widget.totalTime,
                                                widget.isAttempted)
                                        : NavigatorClass()
                                            .navigateToExamsAllQuestionsScreen(
                                                context,
                                                widget.id,
                                                widget.correctMarks,
                                                widget.incorrectMarks,
                                                widget.totalQues,
                                                widget.heading,
                                                widget.testHash,
                                                widget.totalTime,
                                                widget.isAttempted);
                                  },
                                  secondPress: () {
                                    Navigator.pop(context);
                                  },
                                );
                              });
                        } else {
                          showCustomSnackBar(context, ValueString.NO_INTERNET);
                        }
                      });
                    },
                    buttonBorderColor: ColorsUtility.primaryColor,
                    buttonBackgroundColor: ColorsUtility.primaryColor,
                    buttonTextColor: ColorsUtility.white,
                    buttonTextStyle: AppTextStyle.whiteButtonTextStyle,
                    buttonPadding: EdgeInsets.all(buildWidth(context) * 0.02),
                    maxLines: 1,
                    isIconPresent: false,
                    shape: Shape.rectangleBorder20,
                    isSkipped: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PaddingRowWidget extends StatelessWidget {
  final double padding;
  final double rowPadding;
  final IconData icon;
  final Color iconColor;
  final String text;

  PaddingRowWidget(
      {required this.padding,
      required this.rowPadding,
      required this.icon,
      required this.iconColor,
      required this.text});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(rowPadding),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
