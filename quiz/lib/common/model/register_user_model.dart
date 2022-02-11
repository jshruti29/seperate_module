// To parse this JSON data, do
//
//     final registerUserModel = registerUserModelFromJson(jsonString);

import 'dart:convert';

RegisterUserModel registerUserModelFromJson(String str) => RegisterUserModel.fromJson(json.decode(str));

String registerUserModelToJson(RegisterUserModel data) => json.encode(data.toJson());

class RegisterUserModel {
  RegisterUserModel({
    this.userEmail,
    this.userAddress,
    this.zipCode,
    this.orgName,
    this.jobTitle,
    this.role,
    this.userLocation,
    this.prevExamPercentage,
    this.userFirstName,
    this.userLastName,
    this.userContactNo,
    this.userQual,
    this.stream,
    this.userCityName,
    this.userStateName,
    this.userCountryName,
    this.insertStatus,
    this.userId,
    this.userHash,
    this.userImagePath,
    this.percentage,
  });

  String? userEmail;
  dynamic userAddress;
  String? zipCode;
  dynamic orgName;
  dynamic jobTitle;
  String? role;
  dynamic userLocation;
  dynamic prevExamPercentage;
  String? userFirstName;
  String? userLastName;
  String? userContactNo;
  String? userQual;
  String? stream;
  String? userCityName;
  String? userStateName;
  String? userCountryName;
  int? insertStatus;
  String? userId;
  String? userHash;
  String? userImagePath;
  int? percentage;

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) => RegisterUserModel(
    userEmail: json["user_email"],
    userAddress: json["user_address"],
    zipCode: json["zip_code"],
    orgName: json["org_name"],
    jobTitle: json["job_title"],
    role: json["role"],
    userLocation: json["user_location"],
    prevExamPercentage: json["prev_exam_percentage"],
    userFirstName: json["user_first_name"],
    userLastName: json["user_last_name"],
    userContactNo: json["user_contact_no"],
    userQual: json["user_qual"],
    stream: json["stream"],
    userCityName: json["user_city_name"],
    userStateName: json["user_state_name"],
    userCountryName: json["user_country_name"],
    insertStatus: json["insert_status"],
    userId: json["user_id"],
    userHash: json["user_hash"],
    userImagePath: json["user_image_path"],
    percentage: json["percentage"],
  );

  Map<String, dynamic> toJson() => {
    "user_email": userEmail,
    "user_address": userAddress,
    "zip_code": zipCode,
    "org_name": orgName,
    "job_title": jobTitle,
    "role": role,
    "user_location": userLocation,
    "prev_exam_percentage": prevExamPercentage,
    "user_first_name": userFirstName,
    "user_last_name": userLastName,
    "user_contact_no": userContactNo,
    "user_qual": userQual,
    "stream": stream,
    "user_city_name": userCityName,
    "user_state_name": userStateName,
    "user_country_name": userCountryName,
    "insert_status": insertStatus,
    "user_id": userId,
    "user_hash": userHash,
    "user_image_path": userImagePath,
    "percentage": percentage,
  };
}
