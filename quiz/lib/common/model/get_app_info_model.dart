import 'dart:convert';

GetAppInfoModel getAppInfoModelFromJson(String str) => GetAppInfoModel.fromJson(json.decode(str));

String getAppInfoModelToJson(GetAppInfoModel data) => json.encode(data.toJson());

class GetAppInfoModel {
  List<HomeElements>? homeElements;
  int? flag;

  GetAppInfoModel({required this.homeElements, required this.flag});

  factory GetAppInfoModel.fromJson(Map<String, dynamic> json) => GetAppInfoModel(
    flag: json["flag"],
    homeElements: List<HomeElements>.from(json["home_elements"].map((x) => HomeElements.fromJson(x))),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeElements != null) {
      data['home_elements'] = this.homeElements!.map((v) => v.toJson()).toList();
    }
    data['flag'] = this.flag;
    return data;
  }
}

class HomeElements {
  dynamic homeElementId;
  dynamic status;
  dynamic title1;
  dynamic title2;
  dynamic seqNo;

  HomeElements(
      {required this.homeElementId, required this.status, required this.title1, required this.title2, required this.seqNo});

  HomeElements.fromJson(Map<String, dynamic> json) {
    homeElementId = json['home_element_id'];
    status = json['status'];
    title1 = json['title_1'];
    title2 = json['title_2'];
    seqNo = json['seq_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['home_element_id'] = this.homeElementId;
    data['status'] = this.status;
    data['title_1'] = this.title1;
    data['title_2'] = this.title2;
    data['seq_no'] = this.seqNo;
    return data;
  }
}
