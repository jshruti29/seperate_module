// To parse this JSON data, do
//
//     final getFullLengthTestModel = getFullLengthTestModelFromJson(jsonString);

import 'dart:convert';

List<GetFullLengthTestModel> getFullLengthTestModelFromJson(String str) => List<GetFullLengthTestModel>.from(json.decode(str).map((x) => GetFullLengthTestModel.fromJson(x)));

String getFullLengthTestModelToJson(List<GetFullLengthTestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetFullLengthTestModel {
  GetFullLengthTestModel({
    this.title,
    this.subtitle,
    this.subMenu1,
  });

  String? title;
  String? subtitle;
  List<SubMenu1>? subMenu1;

  factory GetFullLengthTestModel.fromJson(Map<String, dynamic> json) => GetFullLengthTestModel(
    title: json["title"],
    subtitle: json["subtitle"],
    subMenu1: List<SubMenu1>.from(json["sub_menu1"].map((x) => SubMenu1.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "sub_menu1": List<dynamic>.from(subMenu1!.map((x) => x.toJson())),
  };
}

class SubMenu1 {
  SubMenu1({
    this.name,
    this.examId,
    this.examId2,
    this.subCategory,
  });

  String? name;
  int? examId;
  int? examId2;
  String? subCategory;

  factory SubMenu1.fromJson(Map<String, dynamic> json) => SubMenu1(
    name: json["name"],
    examId: json["exam_id"],
    examId2: json["exam_id_2"],
    subCategory: json["sub_category"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "exam_id": examId,
    "exam_id_2": examId2,
    "sub_category": subCategory,
  };
}

enum Subtitle { ENGLISH_MEDIUM, HINDI_MEDIUM }

final subtitleValues = EnumValues({
  "English Medium": Subtitle.ENGLISH_MEDIUM,
  "Hindi Medium": Subtitle.HINDI_MEDIUM
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
