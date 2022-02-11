import 'package:quiz/common/api/api_provider.dart';
import 'package:quiz/common/resources/strings/session_string.dart';
import 'package:quiz/globals.dart';

import 'api_constants.dart';
import 'intro_model.dart';

class AppIntroDetails {
  ApiProvider _apiProvider = ApiProvider();

  Future<IntroModelGetList> fetchIntorDetailsConfig() async {
    Map map = {
      SessionString.appIdKey: Global.appId,
    };

    dynamic response =
        await _apiProvider.post(ApiConstants.AppIntroDetail, map);
    return IntroModelGetList.fromJson(response);
  }
}
