//import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/common/resources/strings/colors_utility.dart';

class AppTheme {
  /// Application Theme
  static final ThemeData themeData = new ThemeData.from(
    colorScheme: ColorScheme.light(primary: ColorsUtility.primaryColor),
  ).copyWith(
      dividerColor: ColorsUtility.transparent,
      highlightColor: ColorsUtility.transparent,
      splashColor: ColorsUtility.transparent,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      accentTextTheme: GoogleFonts.latoTextTheme(),
      textTheme: GoogleFonts.latoTextTheme(),
      buttonColor: ColorsUtility.primaryColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          textTheme: GoogleFonts.latoTextTheme().copyWith(
              headline6: GoogleFonts.latoTextTheme()
                  .headline6!
                  .copyWith(fontSize: 20)),
          backgroundColor: ColorsUtility.white,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: ColorsUtility.black),
          iconTheme: IconThemeData(color: ColorsUtility.black)),
      tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: ColorsUtility.black),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: ColorsUtility.white,
          backgroundColor: ColorsUtility.primaryColor),
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          }));
}
