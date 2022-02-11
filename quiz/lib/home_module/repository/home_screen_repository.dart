import 'dart:convert';
import 'dart:math';

import 'package:quiz/common/api/api_provider.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/model/get_app_info_model.dart';
import 'package:quiz/common/resources/strings/session_string.dart';
import 'package:quiz/common/utilities/api_constants.dart';
import 'package:quiz/globals.dart';
import 'package:quiz/home_module/model/app_check_version_model.dart';
import 'package:quiz/home_module/model/app_permission_access_model.dart';
import 'package:quiz/home_module/model/fetch_reading_data_model.dart';
import 'package:quiz/home_module/model/fetch_test_list_content_model.dart';
import 'package:quiz/home_module/model/get_discussion_group_model.dart';
import 'package:quiz/home_module/model/get_full_length_test_model.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:device_info/device_info.dart';

abstract class HomeScreenRepository {
  Future<List<GetFullLengthTestModel>> getFullLengthTestExam();

  Future<AppCheckVersionModel> appCheckVersions();

  Future<List<GetDiscussionGroupModel>> fetchDiscussionGroupData();

  Future fetchAllReadingData();

  Future fetchTestListContent();

  Future<GetAppInfoModel> fetchAppConfig();

  Future<AppPermissionAccessModel> appUserPermissionAccess();
}

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  ApiProvider _apiProvider = ApiProvider();
  MyStore myStore = VxState.store;
  String userid = "1471200",
      userHash = "94bbc28759737bdd6b9cbf174643a5d",
      appId = "3006",
      appHash = "68023c08f278466f0c53981d225e541",
      appVersion = "";

  @override
  Future<FetchReadingDataModel> fetchAllReadingData() async {
    Map map = {
      SessionString.userId: userid,
      SessionString.userHash: userHash,
      SessionString.appHashKey: Global.appHash,
      SessionString.rawCount: '',
      SessionString.maxReadingSyncId: '',
      SessionString.country: SessionString.countryName,
      SessionString.language: 'English'
    };

    final response = await _apiProvider.post(ApiConstants.appFetchReading, map);
    return fetchReadingDataModelFromJson(jsonEncode(response));
  }

  @override
  Future<List<GetDiscussionGroupModel>> fetchDiscussionGroupData() async {
    Map map = {
      SessionString.userId: userid,
      SessionString.appIdKey: Global.appId,
      SessionString.userHash: userHash,
      SessionString.prefCommunityIds: ''
    };

    final response =
        await _apiProvider.post(ApiConstants.discussGroupsList, map);
    return getDiscussionGroupModelFromJson(jsonEncode(response));
  }

  @override
  Future<List<GetFullLengthTestModel>> getFullLengthTestExam() async {
    Map map = {
      SessionString.userId: userid,
      SessionString.appIdKey: Global.appId,
      SessionString.userHash: userHash,
    };

    final response = await _apiProvider.post(ApiConstants.getFLTExamList, map);
    return getFullLengthTestModelFromJson(jsonEncode(response));
  }

  @override
  Future<FetchTestListContentModel> fetchTestListContent() async {
    Map map = {
      SessionString.userId: userid,
      SessionString.appHashKey: Global.appHash,
      SessionString.userHash: userHash,
      SessionString.maxTestSyncId: '',
      SessionString.testCount: '',
      SessionString.country: SessionString.countryName
    };

    final response = await _apiProvider.post(ApiConstants.testList, map);
    return fetchTestListContentModelFromJson(jsonEncode(response));
  }

  @override
  Future<GetAppInfoModel> fetchAppConfig() async {
    Map map = {
      SessionString.version_code: Global.versionCode,
      SessionString.appHashKey: Global.appHash
    };

    final response = await _apiProvider.post(ApiConstants.getAppConfig, map);
    return GetAppInfoModel.fromJson(response);
  }

  @override
  Future<AppPermissionAccessModel> appUserPermissionAccess() async {
    Map map = {
      SessionString.userId: userid,
      SessionString.appIdKey: Global.appId,
      SessionString.userHash: userHash,
    };
    final response =
        await _apiProvider.post(ApiConstants.appUserPermissionAccess, map);
    return AppPermissionAccessModel.fromJson(response);
  }

  @override
  Future<AppCheckVersionModel> appCheckVersions() {
    // TODO: implement appCheckVersions
    throw UnimplementedError();
  }
}
