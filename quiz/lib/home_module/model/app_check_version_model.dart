// To parse this JSON data, do
//
//     final appCheckVersionModel = appCheckVersionModelFromJson(jsonString);

import 'dart:convert';
AppCheckVersionModel appCheckVersionModelFromJson(String str) =>
    AppCheckVersionModel.fromJson(json.decode(str));

String appCheckVersionModelToJson(AppCheckVersionModel data) =>
    json.encode(data.toJson());

class AppCheckVersionModel {
  AppCheckVersionModel({
    this.forceUpdate,
    this.appUpdate,
    this.instName,
    this.dateAppExpiry,
    this.title,
    this.description,
    this.isAdmin,
    this.accountStatus,
    this.accessAllow,
    this.exams,
    this.homeElements,
    this.univ,
  });

  int? forceUpdate;
  bool? appUpdate;
  String? instName;
  DateTime? dateAppExpiry;
  String? title;
  String? description;
  bool? isAdmin;
  String? accountStatus;
  String? accessAllow;
  List<Exam>? exams;
  List<HomeElement>? homeElements;
  List<Univ>? univ;

  factory AppCheckVersionModel.fromJson(Map<String, dynamic> json) =>
      AppCheckVersionModel(
        forceUpdate: json["force_update"],
        appUpdate: json["app_update"],
        instName: json["inst_name"],
        dateAppExpiry: DateTime.parse(json["date_app_expiry"]),
        title: json["title"],
        description: json["description"],
        isAdmin: json["is_admin"],
        accountStatus: json["account_status"],
        accessAllow: json["access_allow"],
        exams: List<Exam>.from(json["exams"].map((x) => Exam.fromJson(x))),
        homeElements: List<HomeElement>.from(
            json["home_elements"].map((x) => HomeElement.fromJson(x))),
        univ: List<Univ>.from(json["univ"].map((x) => Univ.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "force_update": forceUpdate,
        "app_update": appUpdate,
        "inst_name": instName,
        "date_app_expiry":
            "${dateAppExpiry!.year.toString().padLeft(4, '0')}-${dateAppExpiry!.month.toString().padLeft(2, '0')}-${dateAppExpiry!.day.toString().padLeft(2, '0')}",
        "title": title,
        "description": description,
        "is_admin": isAdmin,
        "account_status": accountStatus,
        "access_allow": accessAllow,
        "exams": List<dynamic>.from(exams!.map((x) => x.toJson())),
        "home_elements":
            List<dynamic>.from(homeElements!.map((x) => x.toJson())),
        "univ": List<dynamic>.from(univ!.map((x) => x.toJson())),
      };
}


class Exam {
  Exam({
    this.examId,
    this.examName,
    this.examTitle1,
    this.examTitle2,
    this.tag,
    this.sequenceNo,
    this.status,
  });

  int? examId;
  String? examName;
  String? examTitle1;
  String? examTitle2;
  String? tag;
  int? sequenceNo;
  int? status;

  factory Exam.fromJson(Map<String, dynamic> json) => Exam(
        examId: json["exam_id"],
        examName: json["exam_name"] == null ? null : json["exam_name"],
        examTitle1: json["exam_title_1"] == null ? null : json["exam_title_1"],
        examTitle2: json["exam_title_2"] == null ? null : json["exam_title_2"],
        tag: json["tag"] == null ? null : json["tag"],
        sequenceNo: json["sequence_no"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "exam_id": examId,
        "exam_name": examName == null ? null : examName,
        "exam_title_1": examTitle1 == null ? null : examTitle1,
        "exam_title_2": examTitle2 == null ? null : examTitle2,
        "tag": tag == null ? null : tagValues.reverse![tag],
        "sequence_no": sequenceNo,
        "status": status,
      };
}

enum Tag { EXAM, EMPTY, QUIZ, KZ, FE }

final tagValues = EnumValues({
  "": Tag.EMPTY,
  "exam": Tag.EXAM,
  "fe": Tag.FE,
  "kz": Tag.KZ,
  "quiz": Tag.QUIZ
});

class HomeElement {
  HomeElement({
    this.homeElementId,
    this.status,
    this.title1,
    this.title2,
    this.seqNo,
  });

  String? homeElementId;
  String? status;
  String? title1;
  String? title2;
  int? seqNo;

  factory HomeElement.fromJson(Map<String, dynamic> json) => HomeElement(
        homeElementId: json["home_element_id"],
        status: json["status"],
        title1: json["title_1"],
        title2: json["title_2"],
        seqNo: json["seq_no"],
      );

  Map<String, dynamic> toJson() => {
        "home_element_id": homeElementId,
        "status": status,
        "title_1": title1,
        "title_2": title2,
        "seq_no": seqNo,
      };
}

class Univ {
  Univ({
    this.univId,
    this.status,
    this.title1,
    this.title2,
    this.seqNo,
    this.category,
  });

  String? univId;
  String? status;
  String? title1;
  String? title2;
  int? seqNo;
  String? category;

  factory Univ.fromJson(Map<String, dynamic> json) => Univ(
        univId: json["univ_id"],
        status: json["status"],
        title1: json["title_1"],
        title2: json["title_2"],
        seqNo: json["seq_no"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "univ_id": univId,
        "status": status,
        "title_1": title1,
        "title_2": title2,
        "seq_no": seqNo,
        "category": category,
      };
}

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
