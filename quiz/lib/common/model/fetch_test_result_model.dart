// To parse this JSON data, do
//
//     final fetchTestResultModel = fetchTestResultModelFromJson(jsonString);

import 'dart:convert';

FetchTestResultModel fetchTestResultModelFromJson(String str) => FetchTestResultModel.fromJson(json.decode(str));

String fetchTestResultModelToJson(FetchTestResultModel data) => json.encode(data.toJson());

class FetchTestResultModel {
  FetchTestResultModel({
    this.ques,
    this.percentage,
    this.totCorrect,
    this.totIncorrect,
    this.notAttempt,
    this.markObtain,
    this.flag,
    this.authFlag,
  });

  List<Que>? ques;
  String? percentage;
  String? totCorrect;
  String? totIncorrect;
  int? notAttempt;
  var markObtain;
  int? flag;
  int? authFlag;

  factory FetchTestResultModel.fromJson(Map<String, dynamic> json) => FetchTestResultModel(
    ques: List<Que>.from(json["ques"].map((x) => Que.fromJson(x))),
    percentage: json["percentage"],
    totCorrect: json["totCorrect"],
    totIncorrect: json["totIncorrect"],
    notAttempt: json["notAttempt"],
    markObtain: json["mark_obtain"],
    flag: json["flag"],
    authFlag: json["authFlag"],
  );

  Map<String, dynamic> toJson() => {
    "ques": List<dynamic>.from(ques!.map((x) => x.toJson())),
    "percentage": percentage,
    "totCorrect": totCorrect,
    "totIncorrect": totIncorrect,
    "notAttempt": notAttempt,
    "mark_obtain": markObtain,
    "flag": flag,
    "authFlag": authFlag,
  };
}

class Que {
  Que({
    this.quesId,
    this.quesDesc,
    this.opt1,
    this.opt2,
    this.opt3,
    this.opt4,
    this.opt5,
    this.correctOpt,
    this.quesExpl,
    this.userResponse,
    this.quesStatus,
  });

  String? quesId;
  String? quesDesc;
  String? opt1;
  String? opt2;
  String? opt3;
  String? opt4;
  String? opt5;
  String? correctOpt;
  String? quesExpl;
  dynamic userResponse;
  String? quesStatus;

  factory Que.fromJson(Map<String, dynamic> json) => Que(
    quesId: json["ques_id"],
    quesDesc: json["ques_desc"],
    opt1: json["opt_1"],
    opt2: json["opt_2"],
    opt3: json["opt_3"],
    opt4: json["opt_4"],
    opt5: json["opt_5"],
    correctOpt: json["correct_opt"],
    quesExpl: json["ques_expl"],
    userResponse: json["user_response"],
    quesStatus: json["ques_status"],
  );

  Map<String, dynamic> toJson() => {
    "ques_id": quesId,
    "ques_desc": quesDesc,
    "opt_1": opt1,
    "opt_2": opt2,
    "opt_3": opt3,
    "opt_4": opt4,
    "opt_5": opt5,
    "correct_opt": correctOpt,
    "ques_expl": quesExpl,
    "user_response": userResponse,
    "ques_status": quesStatus,
  };
}

enum QuesStatus { INCORRECT, CORRECT, NOT_ATTEMPT }

final quesStatusValues = EnumValues({
  "correct": QuesStatus.CORRECT,
  "incorrect": QuesStatus.INCORRECT,
  "not attempt": QuesStatus.NOT_ATTEMPT
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
