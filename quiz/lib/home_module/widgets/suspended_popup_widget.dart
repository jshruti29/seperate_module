import 'dart:io';

// import 'package:career_lift_mobile_app/common/resources/strings/colors_utility.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
// import 'package:career_lift_mobile_app/screens/home_module/bloc/home_screen_bloc.dart';
// import 'package:career_lift_mobile_app/screens/home_module/bloc/home_screen_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/common/Resources/strings/colors_utility.dart';
import 'package:quiz/common/Resources/strings/value_string.dart';
import 'package:quiz/home_module/bloc/home_screen_bloc.dart';
import 'package:quiz/home_module/bloc/home_screen_events.dart';

getMessageFlag(BuildContext context, var flag, HomeScreenBloc? homeScreenBloc) {
  String getText = "";
  switch (flag) {
    case 0:
      {
        getText = ValueString.somethingWentWrong;
        break;
      }
    case 1:
      {
        getText = ValueString.requestSubmittedToEnable;
        break;
      }
    case 3:
      {
        getText = ValueString.alreadyRequestedToEnable;
        break;
      }
  }
  showPermissionDialog(context, getText, homeScreenBloc);
}

Future<bool> showExitPopup(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Exit App'),
          content: Text('Do you want to exit an App?'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(false),
              //return false when click on "NO"
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                SystemChannels.platform
                    .invokeMethod<void>('SystemNavigator.pop');
              },
              child: Text('Yes'),
            ),
          ],
        ),
      ) ??
      false;
}

void showPermissionDialog(
    BuildContext context, String msg, HomeScreenBloc? homeScreenBloc) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: msg.length > 1
              ? new Text("$msg")
              : new Text(ValueString.enableAccess),
          content: new Text(
            ValueString.askAdminToEnableModule,
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(ValueString.cancel),
            ),
            TextButton(
              onPressed: () async {
                homeScreenBloc!.add(AppUserPermissionAccessEvent());
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                  backgroundColor: ColorsUtility.primaryColor),
              child: Text(
                msg.length > 1 ? ValueString.ok : ValueString.enableAccess,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
          elevation: 8,
        );
      });
}
