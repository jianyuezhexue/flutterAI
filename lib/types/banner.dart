class BannerData {
  String? desc;
  num? id;
  String? imagePath;
  num? isVisible;
  num? order;
  String? title;
  num? type;
  String? url;

  BannerData({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  });

  BannerData copyWith({
    String? desc,
    num? id,
    String? imagePath,
    num? isVisible,
    num? order,
    String? title,
    num? type,
    String? url,
  }) => BannerData(
    desc: desc ?? this.desc,
    id: id ?? this.id,
    imagePath: imagePath ?? this.imagePath,
    isVisible: isVisible ?? this.isVisible,
    order: order ?? this.order,
    title: title ?? this.title,
    type: type ?? this.type,
    url: url ?? this.url,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["desc"] = desc;
    map["id"] = id;
    map["imagePath"] = imagePath;
    map["isVisible"] = isVisible;
    map["order"] = order;
    map["title"] = title;
    map["type"] = type;
    map["url"] = url;
    return map;
  }

  BannerData.fromJson(dynamic json) {
    desc = json["desc"];
    id = json["id"];
    imagePath = json["imagePath"];
    isVisible = json["isVisible"];
    order = json["order"];
    title = json["title"];
    type = json["type"];
    url = json["url"];
  }
}

class HomeBanner {
  List<BannerData>? dataList;
  num? errorCode;
  String? errorMsg;

  HomeBanner({this.dataList, this.errorCode, this.errorMsg});

  HomeBanner copyWith({List<BannerData>? dataList, num? errorCode, String? errorMsg}) =>
      HomeBanner(
        dataList: dataList ?? this.dataList,
        errorCode: errorCode ?? this.errorCode,
        errorMsg: errorMsg ?? this.errorMsg,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (dataList != null) {
      map["data"] = dataList?.map((v) => v.toJson()).toList();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }

  HomeBanner.fromJson(dynamic json) {
    if (json["data"] != null) {
      dataList = [];
      json["data"].forEach((v) {
        dataList?.add(BannerData.fromJson(v));
      });
    }
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }
}
