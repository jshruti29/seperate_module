import 'package:flutter/material.dart';
import 'package:quiz/common/Screens/common_exam_instruction_screen.dart';
import 'package:quiz/common/Screens/common_exam_instruction_screen.dart';
import 'package:quiz/common/Screens/common_exam_instruction_screen.dart';
import 'package:quiz/common/Screens/common_exam_instruction_screen.dart';
import 'package:quiz/common/widgets/text_widget.dart';
import 'package:quiz/common/resources/strings/colors_utility.dart';
import '../Screens/common_exam_instruction_screen.dart';

class TextButtonWidget extends StatelessWidget {
  TextButtonWidget(
      {required this.buttonTitle,
      required this.onButtonPressed,
      required this.buttonBorderColor,
      required this.buttonBackgroundColor,
      required this.buttonTextColor,
      required this.buttonTextStyle,
      required this.buttonPadding,
      required this.maxLines,
      required this.isIconPresent,
      required this.shape,
      required this.isSkipped});
  final Function()? onButtonPressed;
  final Color buttonBorderColor;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final String buttonTitle;
  final EdgeInsetsGeometry buttonPadding;
  final TextStyle buttonTextStyle;
  final bool isIconPresent;
  final RoundedRectangleBorder shape;
  final int maxLines;
  final bool isSkipped;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: buttonPadding,
        primary: buttonTextColor,
        // minimumSize: minimumSize,
        elevation: (isSkipped) ? 0 : 10,
        shape: shape,
        backgroundColor: buttonBackgroundColor,
        textStyle: buttonTextStyle,
      ),
      child: (isIconPresent)
          ? Container(
              child: Icon(
                Icons.arrow_forward,
                color: ColorsUtility.primaryColor,
              ),
            )
          : TextWidget(
              buttonTitle,
              style: buttonTextStyle,
              softWrap: true,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
      onPressed: onButtonPressed,
    );
  }
}
