// To parse this JSON data, do
//
//     final studentPermissionModel = studentPermissionModelFromJson(jsonString);

import 'dart:convert';

StudentPermissionModel studentPermissionModelFromJson(String str) => StudentPermissionModel.fromJson(json.decode(str));

String studentPermissionModelToJson(StudentPermissionModel data) => json.encode(data.toJson());

class StudentPermissionModel {
  StudentPermissionModel({
    this.studentPermissions,
    this.flag,
  });

  List<String>? studentPermissions;
  int? flag;

  factory StudentPermissionModel.fromJson(Map<String, dynamic> json) => StudentPermissionModel(
    studentPermissions: List<String>.from(json["student_permissions"].map((x) => x)),
    flag: json["flag"],
  );

  Map<String, dynamic> toJson() => {
    "student_permissions": List<dynamic>.from(studentPermissions!.map((x) => x)),
    "flag": flag,
  };
}
