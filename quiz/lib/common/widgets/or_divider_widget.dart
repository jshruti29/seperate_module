// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
// import 'package:career_lift_mobile_app/common/utilities/util.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';
import 'package:quiz/common/Resources/strings/value_string.dart';
import 'package:quiz/common/utilities/util.dart';

class OrDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: buildHeight(context) * 0.025),
      width: buildWidth(context) * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: buildWidth(context) * 0.02),
            child: Text(
              ValueString.or,
              style: TextStyle(
                color: ColorsUtility.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: ColorsUtility.grey,
        height: 1.5,
      ),
    );
  }
}
