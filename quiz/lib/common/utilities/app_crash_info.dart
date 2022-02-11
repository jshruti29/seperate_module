//import 'package:career_lift_mobile_app/common/api/api_provider.dart';
////import 'package:career_lift_mobile_app/common/database/my_store.dart';
//import 'package:career_lift_mobile_app/common/utilities/api_constants.dart';
import 'package:device_info/device_info.dart';
import 'package:quiz/common/api/api_provider.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/utilities/api_constants.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../globals.dart';

class AppCrash {
  ApiProvider _apiProvider = ApiProvider();
  MyStore myStore = VxState.store;
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> deviceInfoMap = Map();
  List<dynamic> mapValues = [];
  Map<String, dynamic> bodyDataMap = Map();

  Future<dynamic> appCrashInfo({
    String? userCase,
    String? screenName,
    String? exceptionFunction,
  }) async {
    AndroidDeviceInfo build = await deviceInfoPlugin.androidInfo;
    MyStore myStore = VxState.store;
    String userid = "1471200",
        userHash = "94bbc28759737bdd6b9cbf174643a5d",
        appId = "3006",
        appHash = "68023c08f278466f0c53981d225e541",
        appVersion = "";
    bodyDataMap = {
      "user_id": userid.toString(),
      "inst_id": "",
      "app_id": Global.appId.toString(),
      "case": userCase,
      "screen_name": screenName,
      "exception_function": exceptionFunction,
      "device_info":
          "${build.brand.toString() + build.device.toString() + build.display.toString()}"
    };
    dynamic response =
        await _apiProvider.post(ApiConstants.appErrorLog, bodyDataMap);
    print("crash app BodyData :-> $bodyDataMap");
    print("crash app response :-> $response");
  }
}
