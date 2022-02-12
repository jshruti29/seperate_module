import 'dart:convert';

// import 'package:career_lift_mobile_app/common/database/my_store.dart';
// import 'package:career_lift_mobile_app/common/database/objectbox_db.dart';
// import 'package:career_lift_mobile_app/common/model/database_model.dart';
// import 'package:career_lift_mobile_app/common/model/get_app_info_model.dart';
// import 'package:career_lift_mobile_app/common/utilities/api_constants.dart';
// import 'package:career_lift_mobile_app/common/utilities/app_crash_info.dart';
// import 'package:career_lift_mobile_app/common/utilities/shared_preferences.dart';
// import 'package:career_lift_mobile_app/screens/home_module/bloc/home_screen_events.dart';
// import 'package:career_lift_mobile_app/screens/home_module/bloc/home_screen_states.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/app_check_version_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/app_permission_access_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/fetch_reading_data_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/fetch_test_list_content_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/get_discussion_group_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/model/get_full_length_test_model.dart';
// import 'package:career_lift_mobile_app/screens/home_module/repository/home_screen_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/database/objectbox_db.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/model/get_app_info_model.dart';
import 'package:quiz/common/utilities/api_constants.dart';
import 'package:quiz/common/utilities/app_crash_info.dart';
import 'package:quiz/common/utilities/shared_preferences.dart';
import 'package:quiz/home_module/model/app_check_version_model.dart';
import 'package:quiz/home_module/model/app_permission_access_model.dart';
import 'package:quiz/home_module/model/fetch_reading_data_model.dart';
import 'package:quiz/home_module/model/fetch_test_list_content_model.dart';
import 'package:quiz/home_module/model/get_discussion_group_model.dart';
import 'package:quiz/home_module/model/get_full_length_test_model.dart';
import 'package:quiz/home_module/repository/home_screen_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bloc/bloc.dart';

import 'home_screen_events.dart';
import 'home_screen_states.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvents, HomeScreenStates> {
  HomeScreenRepository homeScreenRepository;
  MyStore store = VxState.store;

  HomeScreenBloc({required this.homeScreenRepository})
      : super(HomeScreenInitialState());

  HomeScreenStates get initialState => HomeScreenInitialState();

  @override
  Stream<HomeScreenStates> mapEventToState(HomeScreenEvents event) async* {
    if (event is GetFLTExamEvent) {
      try {
        final box = store.dataStore.box<FLTExamElement>();
        List<GetFullLengthTestModel> getFullLengthTestModelList =
            await homeScreenRepository.getFullLengthTestExam();
        store.dataStore.runInTransaction(TxMode.write, () {
          List<FLTExamElement> storedData = getFullLengthTestModelList
              .map((element) => FLTExamElement(
                  sub_menu1: jsonEncode(element.subMenu1),
                  title: element.title,
                  subtitle: element.subtitle))
              .toList();
          box.removeAll();
          box.putMany(storedData);
        });
      } catch (e) {
        AppCrash().appCrashInfo(
            userCase: "${e.toString()}",
            screenName: "Full length test screen",
            exceptionFunction: 'homeScreen Repository');
        print("eee-" + e.toString());
      }
    }
    if (event is GetDiscussionGroupEvent) {
      try {
        final box = store.dataStore.box<GroupElement>();
        List<GetDiscussionGroupModel> getDiscussionGroupModelList =
            await homeScreenRepository.fetchDiscussionGroupData();
        store.dataStore.runInTransaction(TxMode.write, () {
          List<GroupElement> groupData = getDiscussionGroupModelList
              .map((element) => GroupElement(
                  tag: element.tag,
                  groupHashTag: element.groupHashTag,
                  countPost: element.countPost,
                  about: element.about,
                  checkedStatus: element.checkedStatus,
                  communityId: element.communityId,
                  countFollower: element.countFollower))
              .toList();
          box.removeAll();
          box.putMany(groupData);
        });
      } catch (e) {
        AppCrash().appCrashInfo(
            userCase: "homeScreenRepository",
            screenName: "Home Screen",
            exceptionFunction: "${e.toString()}");
        print("eee-" + e.toString());
      }
    }
    if (event is AppCheckVersionEvent) {
      yield AppCheckVersionLoadingState();
      try {
        AppCheckVersionModel appCheckVersionModel =
            await homeScreenRepository.appCheckVersions();
        yield AppCheckVersionLoadedState(
            appCheckVersionModel: appCheckVersionModel);
      } catch (e) {
        AppCrash().appCrashInfo(
            userCase: "homeScreenRepository",
            screenName: "Home Screen",
            exceptionFunction: "${e.toString()}");
        yield AppCheckVersionErrorState();
      }
    }
    if (event is GetTestListContentEvent) {
      try {
        FetchTestListContentModel fetchTestListContentModel =
            await homeScreenRepository.fetchTestListContent();
        final box = store.dataStore.box<TestDataElement>();
        store.dataStore.runInTransaction(TxMode.write, () {
          List<TestDataElement> dataNew = fetchTestListContentModel.testData!
              .map((element) => TestDataElement(
                  test_hash: element.testHash!,
                  add_date: element.addDate!.toIso8601String(),
                  exam_id: element.examId!,
                  is_attempted: element.isAttempted!,
                  is_notify: element.isNotify!,
                  mark_obtain: double.parse(element.markObtain.toString()),
                  negative_mark: element.negativeMark!,
                  percentage: element.percentage,
                  positive_mark: element.positiveMark!,
                  test_desc: element.testDesc!,
                  test_name: element.testName!,
                  test_sequence_no: element.testSequenceNo!,
                  test_status: element.testStatus!,
                  test_tag: element.testTag!,
                  total_mark: element.totalMark!,
                  total_ques: element.totalQues!,
                  total_time: element.totalTime!))
              .toList();
          box.removeAll();
          box.putMany(dataNew);
        });
      } catch (e) {
        AppCrash().appCrashInfo(
            userCase: "homeScreenRepository",
            screenName: "Home Screen",
            exceptionFunction: "${e.toString()}");
        print("eee" + e.toString());
      }
    }
    if (event is FetchReadingDataEvent) {
      try {
        FetchReadingDataModel fetchReadingDataModel =
            await homeScreenRepository.fetchAllReadingData();
        final box = store.dataStore.box<TestReadingElement>();
        store.dataStore.runInTransaction(TxMode.write, () {
          List<TestReadingElement> dataNew = fetchReadingDataModel.readingArr!
              .map((element) => TestReadingElement(
                  add_date: element.addDate!.toIso8601String(),
                  category: element.category,
                  content: element.content,
                  is_notify: element.isNotify,
                  mob_post_hash: element.mobPostHash,
                  seq_no: element.seqNo,
                  status: element.status,
                  subcategory: element.subcategory,
                  title: element.title,
                  type: element.type,
                  url: element.url))
              .toList();
          box.removeAll();
          box.putMany(dataNew);
        });
      } catch (e) {
        AppCrash().appCrashInfo(
            userCase: "homeScreenRepository",
            screenName: "Home Screen",
            exceptionFunction: "${e.toString()}");
      }
    }
    if (event is AppUserPermissionAccessEvent) {
      yield AppUserPermissionAccessLoadingState();
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        AppPermissionAccessModel appPermissionAccessModel =
            await homeScreenRepository.appUserPermissionAccess();
        prefs.setInt(ApiConstants.appUserPermissionAccessFlag,
            appPermissionAccessModel.flag!);
        yield AppUserPermissionAccessLoadedState(
            appPermissionAccessModel: appPermissionAccessModel);
      } catch (e) {
        yield AppUserPermissionAccessErrorState();
      }
    }
    if (event is GetAppConfigEvent) {
      yield GetAppConfigLoadingState();
      try {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        GetAppInfoModel getAppInfoModel =
            await homeScreenRepository.fetchAppConfig();
        // store.clientData = getAppInfoModel;
        if (getAppInfoModel.homeElements != null) {
          List<HomeElements> finalList = [];
          finalList = new List.empty(growable: true);
          finalList.clear();
          getAppInfoModel.homeElements!.forEach((element) {
            finalList.add(element);
          });
          if (prefs.containsKey('homelist')) {
            prefs.getStringList("homelist")!.clear();
          }
          prefs.setStringList(
              'homelist', finalList.map((e) => jsonEncode(e)).toList());
        }
        // if (store.clientData.flag != 1)
        //   yield GetAppConfigErrorState();
        // else {
        //   store.clientData.homeElements!.forEach((element) {
        //     store.clientPermissionList.add(element.homeElementId);
        //   });
        // }
        yield GetAppConfigLoadedState();
      } catch (e) {
        AppCrash().appCrashInfo(
            userCase: "homeScreenRepository",
            screenName: "Home Screen",
            exceptionFunction: "${e.toString()}");
        print("e--" + e.toString());
      }
    }
    if (event is FetchHomeDataEvent) {
      SharedPreference prefs = SharedPreference();
      // List<String> permissions = store.studentPermission.studentPermissions!;
      if (await prefs.containsKey('homelist')) {
        List<String>? homeList = await prefs.getStringList('homelist');
        List data = homeList!.map((e) => jsonDecode(e)).toList();
        List<HomeElements> tempData =
            data.map((e) => HomeElements.fromJson(e)).toList();
        //  List<HomeElements> tempDataNew = store.clientData.homeElements!;
        // List tempDataCheck = tempDataNew.map((e) => jsonEncode(e)).toList();
        // if (tempDataCheck.length != 0) {
        //   tempData.clear();
        //   tempData += tempDataCheck
        //       .map((e) => HomeElements.fromJson(jsonDecode(e)))
        //       .toList();
        //   if (await prefs.containsKey('homelist')) {
        //     await prefs.stringListClear("homelist");
        //   }
        //   prefs.setStringList(
        //       'homelist', tempData.map((e) => jsonEncode(e)).toList());
        // }

        print("tempData--" + tempData.toString());

        // yield FetchHomeDataLoadedState(
        //     tempData: tempData, permissions: permissions);
        // } else {
        //   List<HomeElements> tempData = store.clientData.homeElements!;
        //   print("tempData--" + tempData.toString());
        //   yield FetchHomeDataLoadedState(
        //       tempData: tempData, permissions: permissions);
        //   if (await prefs.containsKey('homelist')) {
        //     prefs.stringListClear("homelist");
        //   }
        //   prefs.setStringList(
        //       'homelist', tempData.map((e) => jsonEncode(e)).toList());
        // }
      }
    }

    void setExamDataIntoDb(AppCheckVersionModel appCheckVersionModel) {
      final box = store.dataStore.box<ExamElement>();
      store.dataStore.runInTransaction(TxMode.write, () {
        List<ExamElement> dataNew = appCheckVersionModel.exams!
            .map((element) => ExamElement(
                exam_id: element.examId,
                exam_title_1: element.examTitle1,
                exam_name: element.examName,
                exam_title_2: element.examTitle2,
                sequence_no: element.sequenceNo,
                status: element.status,
                tag: element.tag))
            .sortedByNum((element) => element.sequence_no as num)
            .toList();
        box.removeAll();
        box.putMany(dataNew);
      });
    }
  }
}
