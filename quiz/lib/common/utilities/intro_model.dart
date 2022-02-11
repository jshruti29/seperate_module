class IntroModelGetList {
  List<IntroModel>? introDynamicDataList;

  IntroModelGetList({required this.introDynamicDataList});

  factory IntroModelGetList.fromJson(Map<String, dynamic> json) =>
      IntroModelGetList(
        introDynamicDataList: List<IntroModel>.from(
            json["intro_cart"].map((x) => IntroModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.introDynamicDataList != null) {
      data['intro_cart'] =
          this.introDynamicDataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class IntroModel {
  String? name;
  String? imagePath;
  String? content;
  String? logo;

  IntroModel({this.name, this.imagePath, this.content, this.logo});

  IntroModel.fromJson(Map<String, dynamic> json) {
    imagePath = json['image'];
    name = json['name'];
    content = json['content'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['image'] = this.imagePath;
    data['name'] = this.name;
    data['content'] = this.content;
    data['logo'] = this.logo;
    return data;
  }
}
