import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final Function()? onButtonPressed;
  final double fontSize;
  final Color color, buttonTextColor;
  final EdgeInsetsGeometry buttonPadding;
  final RoundedRectangleBorder shape;

  const RoundedButtonWidget({
    Key? key,
    required this.buttonTitle,
    required this.onButtonPressed,
    required this.color,
    required this.buttonTextColor,
    required this.fontSize,
    required this.buttonPadding,
    required this.shape
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width * 0.02),
      width: size.width * 0.8,
      child: MaterialButton(
        shape: shape,
        padding: buttonPadding,
        color: color,
        disabledColor: color,
        onPressed: onButtonPressed,
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white, fontSize: fontSize),
        ),
      ),
    );
  }
}
