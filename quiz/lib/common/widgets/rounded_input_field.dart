// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/widgets/text_field_container.dart';

import '../Resources/strings/colors_utility.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final bool? hasPressFunc;
  final Function()? onPress;
  final bool enabled;
  final bool hasIcon;
  final IconData? trailingIcon;
  final Color? color;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<BoxShadow>? boxShadow;
  RoundedInputField({
    Key? key,
    this.boxShadow,
    this.trailingIcon,
    this.onPress,
    this.hasPressFunc = false,
    this.hasIcon = true,
    this.color = ColorsUtility.kPrimaryLightColor,
    required this.hintText,
    this.icon = Icons.person,
    required this.keyboardType,
    required this.controller,
    this.enabled = true,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      boxShadow: widget.boxShadow,
      color: widget.color,
      child: TextField(
        enabled: widget.enabled,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: ColorsUtility.primaryColor,
        decoration: InputDecoration(
          suffixIcon: widget.hasPressFunc!
              ? IconButton(
                  onPressed: widget.onPress, icon: Icon(widget.trailingIcon))
              : null,
          icon: widget.hasIcon
              ? Icon(
                  widget.icon,
                  color: widget.enabled
                      ? ColorsUtility.primaryColor
                      : ColorsUtility.primaryColor.withOpacity(0.5),
                )
              : null,
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
