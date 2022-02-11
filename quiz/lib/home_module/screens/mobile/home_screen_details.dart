import 'dart:convert';
import 'dart:io';

//import 'package:career_lift_mobile_app/common/utilities/push_notification_tag_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/home_module/bloc/home_screen_bloc.dart';
import 'package:quiz/home_module/bloc/home_screen_events.dart';
import 'package:quiz/home_module/bloc/home_screen_states.dart';
import 'package:quiz/home_module/widgets/suspended_popup_widget.dart';
import 'package:reorderables/reorderables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';

import '/common/api/api_provider.dart';
import '/common/database/my_store.dart';
import '/common/model/get_app_info_model.dart';
import '/common/navigator_class/navigator_class.dart';
import '/common/resources/strings/assets_constant.dart';
import '/common/resources/strings/colors_utility.dart';
import '/common/resources/strings/session_string.dart';
import '/common/resources/strings/value_string.dart';
import '/common/utilities/api_constants.dart';
import '/common/utilities/internet_util.dart';
import '/common/utilities/shared_preferences.dart';
import '/common/utilities/util.dart';
import '/globals.dart';
// import '/screens/home_module/bloc/home_screen_bloc.dart';
// import '/screens/home_module/bloc/home_screen_events.dart';
// import '/screens/home_module/bloc/home_screen_states.dart';
// import '/screens/home_module/widgets/suspended_popup_widget.dart';

class HomeScreenDetails extends StatefulWidget {
  @override
  _HomeScreenDetailsState createState() => _HomeScreenDetailsState();
}

class _HomeScreenDetailsState extends State<HomeScreenDetails> {
  late List<IconData> _tiles;
  MyStore store = VxState.store;
  late SharedPreferences prefs;
  late bool isDone, isDynamicLogo = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<HomeElements> finalLisr = [];
  bool isAccessAllowPermission = true;
  bool isAccountSuspended = true;
  HomeScreenBloc? homeScreenBloc;
  String greetingMessageInitial = "Good Night";
  int _pageIndex = 0;
  String apiLogo = "";

  void isAccessAllow(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(SessionString.accessAllow) &&
        prefs.getBool(SessionString.accessAllow) != null) {
      bool permission = prefs.getBool(SessionString.accessAllow) as bool;
      if (!permission) {
        setState(() {
          isAccessAllowPermission = false;
        });
      } else {
        setState(() {
          isAccessAllowPermission = true;
        });
      }
    }
  }

  void accountSuspended(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(SessionString.accountStatus) &&
        prefs.getBool(SessionString.accountStatus) != null) {
      bool accountStatus = prefs.getBool(SessionString.accountStatus) as bool;
      if (accountStatus) {
        setState(() {
          isAccountSuspended = false;
        });
        Fluttertoast.showToast(msg: ValueString.accountSuspended);
      } else {
        setState(() {
          isAccountSuspended = true;
        });
      }
    }
  }

  bool enableConsentButton = false;

  @override
  void initState() {
    super.initState();
    initializeShared();
    isDone = false;
    _tiles = [];
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      homeScreenBloc = BlocProvider.of<HomeScreenBloc>(context);
      homeScreenBloc!.add(GetAppConfigEvent());
      greetingMessage();
      // appLogo(context);
    });
    getDataOfCards();
    qrCodeApiCall();
  }

  Future<dynamic> qrCodeApiCall() async {
    ApiProvider _apiProvider = ApiProvider();
    var bodyDataMap = {
      SessionString.userHash: store.studentData.userHash.toString(),
      SessionString.userId: store.studentData.userId.toString(),
      SessionString.appIdKey: Global.appId.toString(),
    };
    var receivedData = await _apiProvider.post(
        ApiConstants.qrCodePaymentGateWayUrl, bodyDataMap);
    if (receivedData['flag'] == 1 && receivedData["status"] == "success") {
      String qrCode = receivedData["payment"]["qr_code"];
      String instituteHash = receivedData["payment"]["inst_hash"];
      // store.qrCodePayment = qrCode;
      // store.instituteHash = instituteHash;
      print(qrCode.toString());
    } else {
      print(
          "QR code not available for this client Please contact your institutions!");
    }
  }

  Future<void> getDataOfCards() async {
    SharedPreference prefs = SharedPreference();
    //List<String> permissions = store.studentPermission.studentPermissions!;
    if (await prefs.containsKey('homelist')) {
      List<String>? homeList = await prefs.getStringList('homelist');
      List data = homeList!.map((e) => jsonDecode(e)).toList();
      List<HomeElements> tempData =
          data.map((e) => HomeElements.fromJson(e)).toList();
      List<HomeElements> tempDataNew = store.clientData.homeElements!;
      List tempDataCheck = tempDataNew.map((e) => jsonEncode(e)).toList();
      if (tempDataCheck.length != 0) {
        tempData.clear();
        tempData += tempDataCheck
            .map((e) => HomeElements.fromJson(jsonDecode(e)))
            .toList();
        if (await prefs.containsKey('homelist')) {
          await prefs.stringListClear("homelist");
        }
        prefs.setStringList(
            'homelist', tempData.map((e) => jsonEncode(e)).toList());
      }
      getCards(tempData, permissions);
      setState(() {
        isDone = true;
      });
      print("tempData--" + tempData.toString());
    } else {
      List<HomeElements> tempData = store.clientData.homeElements!;
      getCards(tempData, permissions);
      setState(() {
        isDone = true;
      });
      print("tempData--" + tempData.toString());
      if (await prefs.containsKey('homelist')) {
        prefs.stringListClear("homelist");
      }
      prefs.setStringList(
          'homelist', tempData.map((e) => jsonEncode(e)).toList());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onReorder(int oldIndex, int newIndex) async {
    setState(() {
      reorderTheList(oldIndex, newIndex);
    });
  }

  Widget topNavBar(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.only(
        left: 6,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //height: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isDynamicLogo
                      ? Image.network(
                          apiLogo,
                          width: 50,
                          fit: BoxFit.contain,
                        )
                      : Image.asset(
                          AssetsConstant.logo,
                          width: 50,
                          fit: BoxFit.contain,
                        ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, bottom: 8, top: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        Global.appNameMain,
                        maxLines: 2,
                        style: GoogleFonts.lato(
                            fontSize: 18,
                            textStyle:
                                TextStyle(overflow: TextOverflow.ellipsis),
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6A2984)),
                      ),
                    ),
                  ),
                ]),
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Text(
                    '$greetingMessageInitial ${store.studentData.userFirstName.toString()[0].toUpperCase() + store.studentData.userFirstName.toString().substring(1)}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                      fontSize: 21,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  void greetingMessage() async {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      setState(() {
        greetingMessageInitial = "Good Morning";
      });
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      setState(() {
        greetingMessageInitial = "Good Afternoon";
      });
    } else if ((timeNow > 16) && (timeNow < 20)) {
      setState(() {
        greetingMessageInitial = "Good Evening";
      });
    }
  }

  void appLogo(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("logo_splash")) {
      setState(() {
        isDynamicLogo = true;
        apiLogo = prefs.getString("logo_splash")!;
        print("arvind  $apiLogo");
      });
    }
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      //onTap: onTabTapped,
      selectedItemColor: Colors.black,
      unselectedItemColor: Color(0XFFD6DBDE),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/icons/home.png',
                height: 22,
                width: 22,
              ),
            ),
            label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Bookmark"),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications), label: "Bulletin"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
    );
  }

  ReorderableWrap _reOrderWrapWidget(BuildContext context) {
    return ReorderableWrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      buildDraggableFeedback: (context, constraints, widget) {
        return widget;
      },
      crossAxisAlignment: WrapCrossAlignment.start,
      children: <Widget>[] +
          _tiles
              .take(isDone ? 4 : 0)
              .mapIndexed((currentValue, index) => Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? MediaQuery.of(context).size.width / 4.4
                        : MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? MediaQuery.of(context).size.width / 4.4
                        : MediaQuery.of(context).size.width / 2.2,
                    child: Container(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: currentValue.function,
                        child: Image.asset(
                          currentValue.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ))
              .toList() +
          _tiles
              .sublist(isDone ? 4 : 0)
              .mapIndexed((currentValue, index) => Container(
                    margin: EdgeInsets.only(
                      top: 12,
                    ),
                    width: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? MediaQuery.of(context).size.width / 6.6
                        : MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).orientation ==
                            Orientation.landscape
                        ? MediaQuery.of(context).size.width / 6.6
                        : MediaQuery.of(context).size.width / 3.5,
                    child: Container(
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: currentValue.function,
                        child: Image.asset(
                          currentValue.img,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ))
              .toList(),
      onReorder: _onReorder,
    );
  }

  // PushNotificationConfig _pushNotificationConfig = PushNotificationConfig();

  @override
  Widget build(BuildContext context) {
    //_pushNotificationConfig.initPlatformState(context);
    return WillPopScope(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          bottomNavigationBar: _bottomNavigationBar(context),
          body: BlocConsumer<HomeScreenBloc, HomeScreenStates>(
              builder: (BuildContext context, state) {
                return SafeArea(
                  child: Scaffold(
                    key: _scaffoldKey,
                    body: isDone
                        ? SingleChildScrollView(
                            padding: EdgeInsets.only(
                              left: 6,
                              right: 6,
                            ),
                            child: Column(
                              children: [
                                topNavBar(context),
                                listToFullWidget(context),
                              ],
                            ),
                          )
                        : Center(child: CircularProgressIndicator()),
                  ),
                );
              },
              listener: (BuildContext context, state) {}),
        ),
        onWillPop: () async => exit(0));
  }

  Widget listToFullWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _reOrderWrapWidget(context),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }

  void initializeShared() async {
    prefs = await SharedPreferences.getInstance();
  }

  getCards(List<HomeElements>? tempData, List<String>? permissions) {
    _tiles.clear();
    tempData!.forEach((element) {
      if (int.parse(element.homeElementId.toString()) != 236 &&
          int.parse(element.homeElementId.toString()) != 256 &&
          int.parse(element.homeElementId.toString()) != 237 &&
          int.parse(element.homeElementId.toString()) != 231 &&
          int.parse(element.homeElementId.toString()) != 356 &&
          int.parse(element.homeElementId.toString()) != 456 &&
          int.parse(element.homeElementId.toString()) != 370 &&
          int.parse(element.homeElementId.toString()) != 233 &&
          int.parse(element.homeElementId.toString()) != 357) {
        _tiles.add(IconData(
            imgBg: "assets/homeScreen/${element.homeElementId}.png",
            color: (permissions!.contains(element.homeElementId))
                ? ColorsUtility.yellowShade100
                : ColorsUtility.lightBackground,
            function: () async {
              checkThePermissionAndNavigate(element.homeElementId!);
            },
            img: "assets/homeScreen/${element.homeElementId}.png",
            title: "${element.title1}"));
      }
    });
  }

  void checkThePermissionAndNavigate(String element) {
    isAccessAllow(context);
    accountSuspended(context);
    var flag = prefs.getInt(ApiConstants.appUserPermissionAccessFlag);
    if (isAccountSuspended) {
      if (!isAccessAllowPermission &&
          (element == "331" ||
              element == "370" ||
              element == "357" ||
              element == "373" ||
              element == "467")) {
        getMessageFlag(context, flag, homeScreenBloc);
      }
      // else {
      //   NavigatorClass().navigateToDetailsOfModule(context, element);
      // }
    }
  }

  void reorderTheList(oldIndex, newIndex) async {
    IconData row = _tiles.removeAt(oldIndex);
    List<String>? tempPref = prefs.getStringList('homelist');
    dynamic temp = tempPref!.removeAt(oldIndex);
    tempPref.insert(newIndex, temp);
    prefs.setStringList('homelist', tempPref);
    _tiles.insert(newIndex, row);
  }

  void onTabTapped(int index) {
    switch (index) {
      case 1:
        {
          NavigatorClass().navigateToBookmarkScreen(context);
        }
        break;
      case 2:
        {
          NavigatorClass().navigateToInstituteNotificationScreen(context);
        }
        break;
      case 3:
        {
          InternetUtil.isInternetAvailable((status) async {
            if (status) {
              NavigatorClass().navigateToProfileScreen(context);
            } else {
              showCustomSnackBar(context, ValueString.NO_INTERNET);
            }
          });
        }
        break;
    }
  }
}

class IconData {
  String img;
  String imgBg;
  String title;
  Function()? function;
  Color? color;

  IconData(
      {required this.function,
      required this.img,
      required this.imgBg,
      required this.title,
      this.color = const Color(0xfffff9c4)});
}
