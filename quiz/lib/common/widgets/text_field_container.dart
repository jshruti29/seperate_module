import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Border? border;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  const TextFieldContainer({
    this.border,
    this.boxShadow,
    this.color = Colors.white,
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.width * 0.02),
      padding: EdgeInsets.symmetric(horizontal:  size.width * 0.04, vertical:  size.width * 0.02),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        boxShadow: boxShadow,
        border: border,
        color: color,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
