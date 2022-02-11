import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:intl/intl.dart';


double buildWidth(BuildContext context) => MediaQuery.of(context).size.width;
double buildHeight(BuildContext context) => MediaQuery.of(context).size.height;



showSVProgressHUD(BuildContext context) async {

  SVProgressHUD.setRingThickness(buildHeight(context) * 0.008);
  SVProgressHUD.setRingRadius(buildHeight(context) * 0.008);
  SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.black);
  SVProgressHUD.show();
}

dismissSVProgressHUD(BuildContext context) async {
  SVProgressHUD.dismiss();
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar(
    BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 100,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(3.w), topRight: Radius.circular(3.w))),
      action: SnackBarAction(label: 'Dismiss', onPressed: () {}),
      content: Text(text)));
}
centerUserCircleAvatar(final String userImagePath,final double iconHeight,final double radius,[ final Color? backgroundColor,final Color? foregroundColor]) {
  return CircleAvatar(
      backgroundColor: backgroundColor ?? null,
      foregroundColor: foregroundColor ?? null,
      child: userImagePath == ''
          ? Icon(
        Icons.person,
        size: iconHeight,
      )
          : null,
      radius: radius,
      backgroundImage: userImagePath == ''
          ? null
          : NetworkImage(userImagePath));

}
Future<void> launchInBrowser(String url) async {
  if (url.isNotEmpty) {
    if (await canLaunch(url)) {
      await launch(
        url,
        enableJavaScript: true,
        webOnlyWindowName: "https//google.in",
      );
    } else {
      Fluttertoast.showToast(msg: 'Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildLoadingIndicator(BuildContext context,int topSpace) {
  return Center(
    child: Padding(
      padding:  EdgeInsets.only(top:topSpace.h),
      child: CircularProgressIndicator(),
    ),
  );
}

Widget buildErrorUi(String message) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        message,
        style: TextStyle(color: Colors.red,fontSize: 16.sp),
      ),
    ),
  );
}
Widget buildErrorUiCurrentAffairs(String message,int topSpace) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(top:topSpace.h),
      child: Text(
        message,
        style: TextStyle(color: Colors.red,fontSize: 16.sp),
      ),
    ),
  );
}



Widget loadData(String text, double fontSize) {
  try {
    return (text.contains('<img') || text.contains('<p'))
        ? Html.fromDom(document: parseData(text))
        : Text(convertStringToUnicode(htmlparser.parse(text).body!.text),
        style: TextStyle(fontSize: fontSize));
  } catch (e) {
    return Text(
      Bidi.stripHtmlIfNeeded(text),
      style: TextStyle(fontSize: fontSize , color: Colors.black),
    );
  }
}
parseData(String text) {
  try {
    return htmlparser.parse(text);
  } catch (e) {
    return htmlparser.parse(Bidi.stripHtmlIfNeeded(text));
  }
}
String convertStringToUnicode(String content) {
  String regex = "\\u";
  int offset = content.indexOf(regex) + regex.length;
  while (offset > 1) {
    int limit = offset + 4;
    String str = content.substring(offset, limit);
    // ignore: unnecessary_null_comparison
    if (str != null && str.isNotEmpty) {
      String uni = String.fromCharCode(int.parse(str, radix: 16));

      content = content.replaceFirst(regex + str, uni);
    }
    offset = content.indexOf(regex) + regex.length;
  }
  return content.replaceAll('\\n', '\n').replaceAll('\\r', '\r');
}

getFormattedDate() {
  return DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now());
}

