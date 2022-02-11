//import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
//import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
//import 'package:career_lift_mobile_app/common/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/widgets/text_field_container.dart';

import '../Resources/strings/colors_utility.dart';
import '../Resources/strings/value_string.dart';

class PasswordRoundedInputField extends StatefulWidget {
  final TextEditingController controller;
  final Color? color;
  const PasswordRoundedInputField(
      {Key? key, required this.controller, this.color})
      : super(key: key);

  @override
  _PasswordRoundedInputFieldState createState() =>
      _PasswordRoundedInputFieldState();
}

class _PasswordRoundedInputFieldState extends State<PasswordRoundedInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      color: widget.color,
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _obscureText,
        cursorColor: ColorsUtility.primaryColor,
        decoration: InputDecoration(
          hintText: ValueString.password,
          icon: Icon(
            Icons.lock,
            color: ColorsUtility.primaryColor,
          ),
          suffixIcon: IconButton(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            splashRadius: 0.01,
            onPressed: () {
              if (mounted)
                setState(() {
                  _obscureText = !_obscureText;
                });
            },
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            color: _obscureText
                ? ColorsUtility.primaryColor.withOpacity(0.5)
                : ColorsUtility.primaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
