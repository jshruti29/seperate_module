// To parse this JSON data, do
//
//     final fetchTestQuestionsModel = fetchTestQuestionsModelFromJson(jsonString);

import 'dart:convert';

FetchTestQuestionsModel fetchTestQuestionsModelFromJson(String str) => FetchTestQuestionsModel.fromJson(json.decode(str));

String fetchTestQuestionsModelToJson(FetchTestQuestionsModel data) => json.encode(data.toJson());

class FetchTestQuestionsModel {
  FetchTestQuestionsModel({
    this.studentTestStatus,
    this.flag,
    this.authFlag,
    this.questions,
  });

  bool? studentTestStatus;
  int? flag;
  int? authFlag;
  List<Question>? questions;

  factory FetchTestQuestionsModel.fromJson(Map<String, dynamic> json) => FetchTestQuestionsModel(
    studentTestStatus: json["student_test_status"],
    flag: json["flag"],
    authFlag: json["authFlag"],
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "student_test_status": studentTestStatus,
    "flag": flag,
    "authFlag": authFlag,
    "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
  };
}

class Question {
  Question({
    this.quesId,
    this.testId,
    this.quesDesc,
    this.opt1,
    this.opt2,
    this.opt3,
    this.opt4,
    this.opt5,
    this.correctOpt,
    this.sectionName,
    this.quesExpl,
  });

  String? quesId;
  String? testId;
  String? quesDesc;
  String? opt1;
  String? opt2;
  String? opt3;
  String? opt4;
  String? opt5;
  String? correctOpt;
  String? sectionName;
  String? quesExpl;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    quesId: json["ques_id"],
    testId: json["test_id"],
    quesDesc: json["ques_desc"],
    opt1: json["opt_1"],
    opt2: json["opt_2"],
    opt3: json["opt_3"],
    opt4: json["opt_4"],
    opt5: json["opt_5"],
    correctOpt: json["correct_opt"],
    sectionName: json["section_name"],
    quesExpl: json["ques_expl"],
  );

  Map<String, dynamic> toJson() => {
    "ques_id": quesId,
    "test_id": testId,
    "ques_desc": quesDesc,
    "opt_1": opt1,
    "opt_2": opt2,
    "opt_3": opt3,
    "opt_4": opt4,
    "opt_5": opt5,
    "correct_opt": correctOpt,
    "section_name": sectionName,
    "ques_expl": quesExpl,
  };
}

enum SectionName { ENGLISH_LANGUAGE, QUANTITATIVE_APTITUDE, REASONING_ABILITY }

final sectionNameValues = EnumValues({
  "English Language": SectionName.ENGLISH_LANGUAGE,
  "Quantitative Aptitude": SectionName.QUANTITATIVE_APTITUDE,
  "Reasoning Ability": SectionName.REASONING_ABILITY
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
