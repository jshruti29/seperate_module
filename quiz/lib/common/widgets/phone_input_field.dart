//import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
//import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
//import 'package:career_lift_mobile_app/common/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/widgets/text_field_container.dart';

import '../Resources/strings/colors_utility.dart';
import '../Resources/strings/value_string.dart';

class PhoneRoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final bool hasIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color? color;
  PhoneRoundedInputField({
    Key? key,
    this.hasIcon = true,
    required this.hintText,
    this.color = ColorsUtility.kPrimaryLightColor,
    this.icon = Icons.person,
    required this.keyboardType,
    required this.controller,
  }) : super(key: key);

  @override
  _PhoneRoundedInputFieldState createState() => _PhoneRoundedInputFieldState();
}

class _PhoneRoundedInputFieldState extends State<PhoneRoundedInputField> {
  bool validPhoneNo = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: widget.color,
      border: validPhoneNo ? null : Border.all(color: ColorsUtility.red),
      child: TextField(
        onTap: () {
          if (widget.controller.text.length == ValueString.mobileLength) {
            if (mounted)
              setState(() {
                validPhoneNo = true;
              });
          } else {
            if (mounted)
              setState(() {
                validPhoneNo = false;
              });
          }
        },
        onChanged: (e) {
          if (widget.controller.text.length == ValueString.mobileLength) {
            if (mounted)
              setState(() {
                validPhoneNo = true;
              });
          } else {
            if (mounted)
              setState(() {
                validPhoneNo = false;
              });
          }
        },
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: ColorsUtility.primaryColor,
        decoration: InputDecoration(
          icon: widget.hasIcon
              ? Icon(
                  widget.icon,
                  color: ColorsUtility.primaryColor,
                )
              : null,
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
