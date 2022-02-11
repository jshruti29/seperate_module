//import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/common/resources/strings/colors_utility.dart';

import 'dimen.dart';

class AppTextStyle {
  const AppTextStyle._();

  static final TextStyle _textStyle = GoogleFonts.poppins(
      fontStyle: FontStyle.normal, fontSize: Dimens.fontSize16);

  static final TextStyle homeTitleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
    fontWeight: FontWeight.w700,
  );

  // static final TextStyle semiBoldStyle = _textStyle.copyWith(
  //   fontSize: Dimens.fontSize20,
  //   fontWeight: FontWeight.w700,
  // );

  static final TextStyle headerTextStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize19,
      fontWeight: FontWeight.w600,
      color: Colors.black);

  static final headingStyle = _textStyle.copyWith(
    fontWeight: FontWeight.bold,
    fontSize: Dimens.fontSize22,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle blackButtonTextStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w500,
    color: ColorsUtility.black,
    fontSize: Dimens.fontSize20,
  );

  static final TextStyle whiteButtonTextStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w500,
    color: ColorsUtility.white,
    fontSize: Dimens.fontSize20,
  );

  static final TextStyle boldTextStyle = TextStyle(
      fontSize: Dimens.fontSize24,
      fontWeight: FontWeight.bold,
      color: ColorsUtility.primaryColor);

  static final TextStyle tAndCTextStyle =
      TextStyle(color: Colors.white, fontSize: Dimens.fontSize16);

  static final TextStyle cardTitleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize19,
  );
  static final TextStyle profileDetailsStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
  );
  static final TextStyle profileNameStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize24, fontWeight: FontWeight.bold);
  static final TextStyle profileNameUpdateStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize16, fontWeight: FontWeight.bold);
  static final TextStyle profileEmailStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize17,
  );

// Menu
  static final TextStyle menuTitleStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize17, color: ColorsUtility.white);
  static final TextStyle smallMenuTitleStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize16, color: ColorsUtility.white);

  //About Us

  static final TextStyle aboutUsTitleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize22,
  );
  static final TextStyle aboutUsSubTitleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );
  static final TextStyle tabBarMenu = _textStyle.copyWith(
    fontSize: Dimens.fontSize17,
  );
  static final TextStyle bottomTabBarMenu = _textStyle.copyWith(
    fontSize: Dimens.fontSize17,
  );

  static final TextStyle errorTextFieldStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize12, color: ColorsUtility.black);
  static final TextStyle errorStyle = _textStyle.copyWith(
      fontSize: Dimens.fontSize14, color: ColorsUtility.black);

  // Study Zone

  static final TextStyle studyZoneCardStyle =
      _textStyle.copyWith(fontSize: Dimens.fontSize18, color: Colors.black);
  static final TextStyle listSubtitleStyle =
      _textStyle.copyWith(fontSize: Dimens.fontSize145);

  static final TextStyle listTitleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize165,
  );

// Video Player Screen

  static final TextStyle titleStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize24,
  );
  static final TextStyle descStyle = _textStyle.copyWith(
    fontSize: Dimens.fontSize18,
  );
}
