import 'dart:ui';
// import 'package:career_lift_mobile_app/common/resources/strings/assets_constant.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/value_string.dart';
// import 'package:career_lift_mobile_app/common/resources/style/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiz/common/Resources/strings/assets_constant.dart';
import 'package:quiz/common/Resources/strings/value_string.dart';
import 'package:quiz/common/Resources/style/decoration.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DialogWidget {
  static void showDialogWidget(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => DialogBox(
              topIcon: Image.asset(AssetsConstant.termsConditionsAsset),
              title: ValueString.termsConditions,
              text: ValueString.close,
              children: [
                Text(
                  ValueString.tncContent,
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 1.h,
                )
              ],
            ));
  }

  static void cameraPermissionSettingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('Camera Permission'),
              content: Text(
                  'This app needs camera access to take pictures for upload user profile photo'),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text('Deny'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                CupertinoDialogAction(
                  child: Text('Settings'),
                  onPressed: () => openAppSettings(),
                ),
              ],
            ));
  }
}

class DialogBox extends StatefulWidget {
  final String title, text;
  final Image? img;
  final List<Widget> children;
  final Widget topIcon;

  const DialogBox(
      {Key? key,
      required this.topIcon,
      required this.title,
      required this.text,
      required this.children,
      this.img})
      : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: Shape.rectangleBorder20,
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: ExploreConstants.padding,
              top: ExploreConstants.avatarRadius + ExploreConstants.padding,
              right: ExploreConstants.padding,
              bottom: ExploreConstants.padding - 10),
          margin: EdgeInsets.only(top: ExploreConstants.avatarRadius),
          decoration: Decorations.dialogDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.title,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Center(
                  child: ListView(
                    children: widget.children,
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue[400],
                        shape: Shape.rectangleBorder10),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 18.sp, color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: ExploreConstants.padding,
          right: ExploreConstants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: ExploreConstants.avatarRadius,
            child: ClipRRect(
                borderRadius: BorderRadius.all(
                    Radius.circular(ExploreConstants.avatarRadius)),
                child: widget.topIcon),
          ),
        ),
      ],
    );
  }
}
