// import 'package:career_lift_mobile_app/common/database/my_store.dart';
// import 'package:career_lift_mobile_app/common/navigator_class/navigator_class.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/assets_constant.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
// import 'package:career_lift_mobile_app/common/resources/style/app_text_style.dart';
// import 'package:career_lift_mobile_app/globals.dart';
// import 'package:career_lift_mobile_app/common/utilities/internet_util.dart';
// import 'package:career_lift_mobile_app/common/utilities/util.dart';
// import 'package:career_lift_mobile_app/common/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz/common/Resources/strings/assets_constant.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';
import 'package:quiz/common/Resources/strings/value_string.dart';
import 'package:quiz/common/Resources/style/app_text_style.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/navigator_class/navigator_class.dart';
import 'package:quiz/common/utilities/internet_util.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:quiz/common/widgets/text_widget.dart';
import 'package:quiz/globals.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget homeAppBarWidget(BuildContext context, MyStore store, String appbarTitle,
    GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    toolbarHeight: 88.h,
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        size: 8.w,
      ),
      onPressed: () => scaffoldKey.currentState!.openDrawer(),
    ),
    centerTitle: false,
    title: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(
            AssetsConstant.logo,
            fit: BoxFit.contain,
            height: 50.w,
            width: 50.w,
          ),
        ),
        title: TextWidget(
          Global.appNameMain,
          style: AppTextStyle.homeTitleStyle,
        )),
    actions: [
      IconButton(
          onPressed: () {
            InternetUtil.isInternetAvailable((status) async {
              if (status) {
                // NavigatorClass().navigateToProfileScreen(context);
              } else {
                showCustomSnackBar(context, ValueString.NO_INTERNET);
              }
            });
          },
          icon: FittedBox(
            fit: BoxFit.contain,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ColorsUtility.primaryColor),
              height: 18.w,
              width: 18.w,
              child: Stack(children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: CircularPercentIndicator(
                    radius: 18.w,
                    lineWidth: 0.8.w,
                    animation: true,
                    animationDuration: 1500,
                    percent: (76),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.deepPurple[900],
                    backgroundColor: ColorsUtility.primaryColor,
                    //center: getProfileIcon(),
                  ),
                ),
              ]),
            ),
          )),
      IconButton(
          onPressed: () {
            // NavigatorClass().na
          },
          icon: Icon(Icons.bookmark, size: 8.w))
    ],
  );
}
