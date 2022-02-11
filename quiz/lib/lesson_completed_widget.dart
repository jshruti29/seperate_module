import 'package:quiz/common/resources/strings/colors_utility.dart';
import 'package:quiz/common/resources/strings/value_string.dart';
import 'package:quiz/common/resources/style/app_text_style.dart';
import 'package:quiz/common/resources/style/decoration.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:quiz/common/widgets/text_button_widget.dart';
import 'package:quiz/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LessonCompleted extends StatefulWidget {
  const LessonCompleted({Key? key}) : super(key: key);

  @override
  _LessonCompletedState createState() => _LessonCompletedState();
}

class _LessonCompletedState extends State<LessonCompleted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: OrientationBuilder(
        builder: (context, orientation) {
          return (orientation == Orientation.portrait)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      Expanded(
                          flex: 2, child: Image.asset('assets/completed.png')),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child: TextWidget(
                                ValueString.congratulations,
                                style: AppTextStyle.aboutUsTitleStyle,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(1.h),
                              child: TextWidget(
                                ValueString.materialCompleted,
                                style: AppTextStyle.profileDetailsStyle,
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: buildWidth(context) * 0.03),
                                child: Container(
                                    width: buildWidth(context) * 0.58,
                                    child: TextButtonWidget(
                                        isSkipped: false,
                                        buttonTitle: ValueString.kContinue,
                                        onButtonPressed: () {
                                          Navigator.pop(context);
                                        },
                                        buttonBorderColor: ColorsUtility.white,
                                        buttonBackgroundColor:
                                            ColorsUtility.primaryColor,
                                        buttonTextColor: ColorsUtility.white,
                                        buttonTextStyle:
                                            AppTextStyle.whiteButtonTextStyle,
                                        buttonPadding: EdgeInsets.all(
                                            buildWidth(context) * 0.022),
                                        maxLines: 1,
                                        isIconPresent: false,
                                        shape: Shape.rectangleBorder20)))
                          ],
                        ),
                      )
                    ])
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      Expanded(child: Image.asset('assets/completed.png')),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ValueString.congratulations,
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            Text(
                              ValueString.lessonCompleted,
                              style: TextStyle(fontSize: 20),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60.0, vertical: 5),
                                    child: Text(
                                      ValueString.kContinue,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  ),
                                  style: TextButton.styleFrom(
                                      elevation: 10,
                                      backgroundColor:
                                          ColorsUtility.primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                            )
                          ],
                        ),
                      )
                    ]);
        },
      ),
    ));
  }
}
