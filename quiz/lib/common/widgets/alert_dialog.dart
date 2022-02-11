import 'package:flutter/material.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';
import 'package:quiz/common/Screens/common_exam_instruction_screen.dart';
import 'package:quiz/common/Screens/common_exam_instruction_screen.dart';
import 'package:quiz/common/resources/strings/value_string.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Resources/style/decoration.dart';

class AlertBox extends StatefulWidget {
  final String text, secondText, title, content;
  final Function() press, secondPress;
  AlertBox({
    required this.text,
    required this.title,
    required this.content,
    required this.secondText,
    required this.press,
    required this.secondPress,
  });
  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends State<AlertBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ExploreConstants.padding),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(top: 2.h, left: 2.h, right: 2.h, bottom: 1.5.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 20.sp),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              widget.content,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17.sp),
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor:
                          ColorsUtility.primaryColor.withOpacity(0.5),
                      shape: Shape.rectangleBorder10,
                    ),
                    onPressed: widget.secondPress,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        widget.secondText,
                        style: TextStyle(
                            fontSize: 18.sp, color: ColorsUtility.white),
                      ),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorsUtility.primaryColor,
                      shape: Shape.rectangleBorder10,
                    ),
                    onPressed: widget.press,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            fontSize: 18.sp, color: ColorsUtility.white),
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
