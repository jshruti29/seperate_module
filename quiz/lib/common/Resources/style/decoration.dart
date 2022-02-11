//import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
import 'package:flutter/material.dart';
import 'package:quiz/common/resources/strings/value_string.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Shape {
  const Shape._();

  static final RoundedRectangleBorder rectangleBorder100 =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.w));
  static final RoundedRectangleBorder rectangleBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(29));
  static final RoundedRectangleBorder rectangleBorder20 =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.w));
  static final RoundedRectangleBorder rectangleBorder10 =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.w));
  static final RoundedRectangleBorder noBorder =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(0));
  static final RoundedRectangleBorder rectangleBorder8 =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8));
}

class Decorations {
  const Decorations._();

  static final dialogDecoration = BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: BorderRadius.circular(ExploreConstants.padding),
      boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 10),
      ]);
}
