import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz/common/api/api_provider.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/model/fetch_test_data_hash_model.dart';
import 'package:quiz/common/model/fetch_test_questions_model.dart';
import 'package:quiz/common/model/fetch_test_result_model.dart';
import 'package:quiz/common/model/submit_test_result_model.dart';
import 'package:quiz/common/resources/strings/session_string.dart';
import 'package:quiz/common/resources/strings/value_string.dart';
import 'package:quiz/common/utilities/api_constants.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../globals.dart';

abstract class CommonApiRepository {
  Future<FetchTestQuestionsModel> fetchTestQuestions(testHash);

  Future<FetchTestResultModel> fetchTestResult(testHash, totalQues);

  Future<FetchTestDataHashModel> fetchTestDataHash(dataHash);

  Future<SubmitTestResultModel> submitTestResult(
      testHash, positiveMarks, negativeMarks, queString);
}

class CommonApiRepositoryImpl implements CommonApiRepository {
  ApiProvider _apiProvider = ApiProvider();
  MyStore myStore = VxState.store;
  String userid = "1471200",
      userHash = "94bbc28759737bdd6b9cbf174643a5d",
      appId = "3006",
      appHash = "68023c08f278466f0c53981d225e541",
      appVersion = "";

  Future<FetchTestQuestionsModel> fetchTestQuestions(testHash) async {
    Map map = {
      SessionString.userId: userid,
      SessionString.userHash: userHash,
      SessionString.rgcmId: '',
      SessionString.testHashkey: testHash,
    };
    final response =
        await _apiProvider.post(ApiConstants.getTestQuestions, map);
    return FetchTestQuestionsModel.fromJson(response);
  }

  Future<SubmitTestResultModel> submitTestResult(
      testHash, positiveMarks, negativeMarks, queString) async {
    Map map = {
      SessionString.userId: userid,
      SessionString.userHash: userHash,
      SessionString.rgcmId: '',
      SessionString.testHashkey: testHash,
      SessionString.positiveMark: positiveMarks,
      SessionString.negativeMark: negativeMarks,
      SessionString.queString: queString
    };
    final response =
        await _apiProvider.post(ApiConstants.postTestResultDetails, map);
    return SubmitTestResultModel.fromJson(response);
  }

  Future<FetchTestResultModel> fetchTestResult(testHash, totalQues) async {
    Map map = {
      SessionString.userId: userid,
      SessionString.userHash: userHash,
      SessionString.rgcmId: '',
      SessionString.testHashkey: testHash,
      SessionString.totQues: totalQues
    };

    final response = await _apiProvider.post(ApiConstants.fetchResult, map);
    return FetchTestResultModel.fromJson(response);
  }

  @override
  Future<FetchTestDataHashModel> fetchTestDataHash(dataHash) async {
    Map map = {
      SessionString.userId: userid,
      SessionString.userHash: userHash,
      SessionString.dataHashKey: dataHash
    };

    final response = await _apiProvider.post(ApiConstants.getDataByHash, map);
    return FetchTestDataHashModel.fromJson(response);
  }
}
