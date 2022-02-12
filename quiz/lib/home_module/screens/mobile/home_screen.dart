// import 'package:career_lift_mobile_app/common/database/my_store.dart';
// import 'package:career_lift_mobile_app/common/model/get_app_info_model.dart';
// import 'package:career_lift_mobile_app/common/navigator_class/navigator_class.dart';
// import 'package:career_lift_mobile_app/common/resources/strings/session_string.dart';
// import 'package:career_lift_mobile_app/common/utilities/push_notification_tag_update.dart';
// import 'package:career_lift_mobile_app/common/utilities/shared_preferences.dart';
// import 'package:career_lift_mobile_app/screens/home_module/bloc/home_screen_bloc.dart';
// import 'package:career_lift_mobile_app/screens/home_module/bloc/home_screen_events.dart';
// import 'package:career_lift_mobile_app/screens/home_module/bloc/home_screen_states.dart';
// import 'package:career_lift_mobile_app/screens/home_module/screens/mobile/home_screen_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:intl/intl.dart';
import 'package:quiz/common/Resources/strings/session_string.dart';
import 'package:quiz/common/utilities/shared_preferences.dart';
import 'package:quiz/home_module/bloc/home_screen_bloc.dart';
import 'package:quiz/home_module/bloc/home_screen_events.dart';
import 'package:quiz/home_module/bloc/home_screen_states.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_screen_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //MyStore store = VxState.store;
  late SharedPreference prefs = SharedPreference();
  HomeScreenBloc? homeScreenBloc;

  @override
  void initState() {
    super.initState();

    homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
    //  /store.studentPermission.studentPermissions!.forEach((element) {
    //     switch (element) {
    //       case '230':
    //         homeScreenBloc!.add(GetDiscussionGroupEvent());
    //         break;
    //       case '229':
    //         break;
    //       case '331':
    //         homeScreenBloc!.add(GetFLTExamEvent());
    //         break;
    //       default:
    //         break;
    //     }
    //   });
    homeScreenBloc!.add(AppCheckVersionEvent());
    homeScreenBloc!.add(GetTestListContentEvent());
    homeScreenBloc!.add(FetchReadingDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: BlocConsumer<HomeScreenBloc, HomeScreenStates>(
              builder: (context, state) {
            return HomeScreenDetails();
          }, listener: (context, state) {
            if (state is AppCheckVersionLoadedState) {
              var forceUpdate = state.appCheckVersionModel!.forceUpdate;
              var allowAccess = state.appCheckVersionModel!.accessAllow;
              var isAdmin = state.appCheckVersionModel!.isAdmin;
              var accountStatus = state.appCheckVersionModel!.accountStatus;
              // if(store.studentData.userId == "1446392"){
              //   isAdmin = true ;
              // }
              print(
                  "force update--- $forceUpdate, \n allowAccess---$allowAccess "
                  "\nisAdmin----$isAdmin, \nAccount status----$accountStatus");
              if (allowAccess == "No") {
                prefs.setBool(SessionString.accessAllow, false);
              } else {
                prefs.setBool(SessionString.accessAllow, true);
              }

              if (accountStatus != null && accountStatus == "1") {
                prefs.setBool(SessionString.accountStatus, false);
              } else {
                prefs.setBool(SessionString.accountStatus, true);
              }
              if (isAdmin != null && isAdmin) {
                FlutterWindowManager.clearFlags(
                    FlutterWindowManager.FLAG_SECURE);
                prefs.setBool(SessionString.isAdmin, true);
              } else {
                FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
                prefs.setBool(SessionString.isAdmin, false);
              }
              // store.clientData = GetAppInfoModel.fromJson(
              //     state.appCheckVersionModel!.toJson());
              DateTime? expiryDate = state.appCheckVersionModel!.dateAppExpiry;
              // if (forceUpdate != null && forceUpdate == 0) {
              //   NavigatorClass()
              //       .navigateToAppUpdateAndExpiryScreen(context, false);
              // } else if (expiryDate != null) {
              //   DateTime tempDate =
              //       new DateFormat("yyyy-MM-dd").parse(expiryDate.toString());
              //   if (tempDate.isBefore(DateTime.now())) {
              //     NavigatorClass()
              //         .navigateToAppUpdateAndExpiryScreen(context, true);
              //   }
              // }
              // homeScreenBloc!.setExamDataIntoDb(state.appCheckVersionModel!);
            }
          }),
        ),
        onWillPop: () => _willPopCallback());
  }

  _willPopCallback() async {
    SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  }
}
