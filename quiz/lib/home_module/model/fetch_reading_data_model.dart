// To parse this JSON data, do
//
//     final fetchReadingDataModel = fetchReadingDataModelFromJson(jsonString);

import 'dart:convert';

FetchReadingDataModel fetchReadingDataModelFromJson(String str) => FetchReadingDataModel.fromJson(json.decode(str));

String fetchReadingDataModelToJson(FetchReadingDataModel data) => json.encode(data.toJson());

class FetchReadingDataModel {
  FetchReadingDataModel({
    this.readingArr,
    this.maxUserReadingSyncId,
  });

  List<ReadingArr>? readingArr;
  String? maxUserReadingSyncId;

  factory FetchReadingDataModel.fromJson(Map<String, dynamic> json) => FetchReadingDataModel(
    readingArr: List<ReadingArr>.from(json["reading_arr"].map((x) => ReadingArr.fromJson(x))),
    maxUserReadingSyncId: json["max_user_reading_sync_id"],
  );

  Map<String, dynamic> toJson() => {
    "reading_arr": List<dynamic>.from(readingArr!.map((x) => x.toJson())),
    "max_user_reading_sync_id": maxUserReadingSyncId,
  };
}

class ReadingArr {
  ReadingArr({
    this.mobPostHash,
    this.title,
    this.content,
    this.addDate,
    this.category,
    this.subcategory,
    this.type,
    this.url,
    this.seqNo,
    this.status,
    this.isNotify,
  });

  String? mobPostHash;
  String? title;
  String? content;
  DateTime? addDate;
  String? category;
  String? subcategory;
  String? type;
  dynamic url;
  int? seqNo;
  String? status;
  int? isNotify;

  factory ReadingArr.fromJson(Map<String, dynamic> json) => ReadingArr(
    mobPostHash: json["mob_post_hash"],
    title: json["title"],
    content: json["content"],
    addDate: DateTime.parse(json["add_date"]),
    category: json["category"],
    subcategory: json["subcategory"],
    type: json["type"],
    url: json["url"],
    seqNo: json["seq_no"],
    status: json["status"],
    isNotify: json["is_notify"],
  );

  Map<String, dynamic> toJson() => {
    "mob_post_hash": mobPostHash,
    "title": title,
    "content": content,
    "add_date": addDate,
    "category": category,
    "subcategory": subcategory,
    "type": type,
    "url": url,
    "seq_no": seqNo,
    "status": status,
    "is_notify": isNotify,
  };
}

enum Category { EXAM, CA_INTL_HIN }

final categoryValues = EnumValues({
  "CA_INTL_HIN": Category.CA_INTL_HIN,
  "exam": Category.EXAM
});

enum Status { INACTIVE, ACTIVE }

final statusValues = EnumValues({
  "active": Status.ACTIVE,
  "inactive": Status.INACTIVE
});

enum Type { ARTICLE, FAQ, EMPTY }

final typeValues = EnumValues({
  "article": Type.ARTICLE,
  "": Type.EMPTY,
  "faq": Type.FAQ
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
