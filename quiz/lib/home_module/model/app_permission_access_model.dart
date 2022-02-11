// To parse this JSON data, do
//
//     final appPermissionAccessModel = appPermissionAccessModelFromJson(jsonString);

import 'dart:convert';

AppPermissionAccessModel appPermissionAccessModelFromJson(String str) => AppPermissionAccessModel.fromJson(json.decode(str));

String appPermissionAccessModelToJson(AppPermissionAccessModel data) => json.encode(data.toJson());

class AppPermissionAccessModel {
  AppPermissionAccessModel({
    this.flag,
  });

  int? flag;

  factory AppPermissionAccessModel.fromJson(Map<String, dynamic> json) => AppPermissionAccessModel(
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
  };
}
