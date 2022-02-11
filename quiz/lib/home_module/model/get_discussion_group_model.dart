// To parse this JSON data, do
//
//     final getDiscussionGroupModel = getDiscussionGroupModelFromJson(jsonString);

import 'dart:convert';

List<GetDiscussionGroupModel> getDiscussionGroupModelFromJson(String str) => List<GetDiscussionGroupModel>.from(json.decode(str).map((x) => GetDiscussionGroupModel.fromJson(x)));

String getDiscussionGroupModelToJson(List<GetDiscussionGroupModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetDiscussionGroupModel {
  GetDiscussionGroupModel({
    this.communityId,
    this.tag,
    this.countFollower,
    this.countPost,
    this.about,
    this.groupHashTag,
    this.checkedStatus,
  });

  String? communityId;
  String? tag;
  int? countFollower;
  int? countPost;
  String? about;
  String? groupHashTag;
  int? checkedStatus;

  factory GetDiscussionGroupModel.fromJson(Map<String, dynamic> json) => GetDiscussionGroupModel(
    communityId: json["community_id"],
    tag: json["tag"],
    countFollower: json["count_follower"],
    countPost: json["count_post"],
    about: json["about"],
    groupHashTag: json["group_hash_tag"],
    checkedStatus: json["checked_status"],
  );

  Map<String, dynamic> toJson() => {
    "community_id": communityId,
    "tag": tag,
    "count_follower": countFollower,
    "count_post": countPost,
    "about": about,
    "group_hash_tag": groupHashTag,
    "checked_status": checkedStatus,
  };
}
