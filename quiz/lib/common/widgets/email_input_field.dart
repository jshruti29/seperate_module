// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';
import 'package:quiz/common/widgets/text_field_container.dart';

class EmailRoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData? icon;
  final Color? color;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const EmailRoundedInputField({
    Key? key,
    required this.hintText,
    this.color = Colors.white,
    this.icon = Icons.person,
    required this.keyboardType,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailRoundedInputFieldState createState() => _EmailRoundedInputFieldState();
}

class _EmailRoundedInputFieldState extends State<EmailRoundedInputField> {
  bool validEmail = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: widget.color,
      border: validEmail ? null : Border.all(color: Colors.red),
      child: TextField(
        onTap: () {
          if (EmailValidator.validate(widget.controller.text)) {
            if (mounted)
              setState(() {
                validEmail = true;
              });
          } else {
            if (mounted)
              setState(() {
                validEmail = false;
              });
          }
        },
        onChanged: (e) {
          if (EmailValidator.validate(widget.controller.text)) {
            if (mounted)
              setState(() {
                validEmail = true;
              });
          } else {
            if (mounted)
              setState(() {
                validEmail = false;
              });
          }
        },
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        cursorColor: ColorsUtility.primaryColor,
        decoration: InputDecoration(
          icon: Icon(
            widget.icon,
            color: ColorsUtility.primaryColor,
          ),
          hintText: widget.hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
