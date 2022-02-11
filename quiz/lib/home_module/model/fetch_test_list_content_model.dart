// To parse this JSON data, do
//
//     final fetchTestListContentModel = fetchTestListContentModelFromJson(jsonString);

import 'dart:convert';

FetchTestListContentModel fetchTestListContentModelFromJson(String str) => FetchTestListContentModel.fromJson(json.decode(str));

String fetchTestListContentModelToJson(FetchTestListContentModel data) => json.encode(data.toJson());

class FetchTestListContentModel {
  FetchTestListContentModel({
    this.flag,
    this.testData,
    this.maxTestSyncId,
  });

  int? flag;
  List<TestDatum>? testData;
  String? maxTestSyncId;

  factory FetchTestListContentModel.fromJson(Map<String, dynamic> json) => FetchTestListContentModel(
    flag: json["flag"],
    testData: List<TestDatum>.from(json["test_data"].map((x) => TestDatum.fromJson(x))),
    maxTestSyncId: json["max_test_sync_id"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "test_data": List<dynamic>.from(testData!.map((x) => x.toJson())),
    "max_test_sync_id": maxTestSyncId,
  };
}

class TestDatum {
  TestDatum({
    this.testHash,
    this.examId,
    this.testStatus,
    this.testName,
    this.testTag,
    this.totalQues,
    this.totalTime,
    this.testDesc,
    this.testSequenceNo,
    this.isNotify,
    this.addDate,
    this.positiveMark,
    this.negativeMark,
    this.totalMark,
    this.isAttempted,
    this.percentage,
    this.markObtain,
  });

  String? testHash;
  int? examId;
  int? testStatus;
  String? testName;
  String? testTag;
  String? totalQues;
  String? totalTime;
  String? testDesc;
  String? testSequenceNo;
  int? isNotify;
  DateTime? addDate;
  String? positiveMark;
  String? negativeMark;
  String? totalMark;
  int? isAttempted;
  dynamic percentage;
  double? markObtain;

  factory TestDatum.fromJson(Map<String, dynamic> json) => TestDatum(
    testHash: json["test_hash"],
    examId: json["exam_id"],
    testStatus: json["test_status"],
    testName: json["test_name"],
    testTag: json["test_tag"] == null ? '' : json["test_tag"],
    totalQues: json["total_ques"],
    totalTime: json["total_time"],
    testDesc: json["test_desc"],
    testSequenceNo: json["test_sequence_no"],
    isNotify: json["is_notify"],
    addDate: json["add_date"] == null ? new DateTime(0) : DateTime.parse(json["add_date"]),
    positiveMark: json["positive_mark"] == null ? '' : json["positive_mark"],
    negativeMark: json["negative_mark"] == null ? '' : json["negative_mark"],
    totalMark: json["total_mark"] == null ? '' : json["total_mark"],
    isAttempted: json["is_attempted"],
    percentage: json["percentage"],
    markObtain: json["mark_obtain"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "test_hash": testHash,
    "exam_id": examId,
    "test_status": testStatus,
    "test_name": testName,
    "test_tag": testTag == null ? '' : testTag,
    "total_ques": totalQues,
    "total_time": totalTime,
    "test_desc": testDesc,
    "test_sequence_no": testSequenceNo,
    "is_notify": isNotify,
    "add_date": addDate == null ? '' : addDate,
    "positive_mark": positiveMark == null ? '' : positiveMark,
    "negative_mark": negativeMark == null ? '' : negativeMark,
    "total_mark": totalMark == null ? '' : totalMark,
    "is_attempted": isAttempted,
    "percentage": percentage,
    "mark_obtain": markObtain,
  };
}
