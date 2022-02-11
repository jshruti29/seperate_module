// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';

class NewPostTextFieldContainer extends StatelessWidget {
  final Widget child;
  final Border? border;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  const NewPostTextFieldContainer({
    this.border,
    this.boxShadow,
    this.color = ColorsUtility.primaryLightColor,
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
