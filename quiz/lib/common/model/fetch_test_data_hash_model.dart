// To parse this JSON data, do
//
//     final fetchTestDataHashModel = fetchTestDataHashModelFromJson(jsonString);

import 'dart:convert';

FetchTestDataHashModel fetchTestDataHashModelFromJson(String str) => FetchTestDataHashModel.fromJson(json.decode(str));

String fetchTestDataHashModelToJson(FetchTestDataHashModel data) => json.encode(data.toJson());

class FetchTestDataHashModel {
  FetchTestDataHashModel({
    this.flag,
    this.content,
    this.image,
  });

  int? flag;
  String? content;
  String? image;

  factory FetchTestDataHashModel.fromJson(Map<String, dynamic> json) => FetchTestDataHashModel(
    flag: json["flag"],
    content: json["content"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "flag": flag,
    "content": content,
    "image": image,
  };
}
