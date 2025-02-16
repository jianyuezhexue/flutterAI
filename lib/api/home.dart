import 'package:assistant/api/http.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../types/banner.dart';

class HomeApi with ChangeNotifier {
  List<BannerData>? bannerData;

  Future getBanners() async {
    Response response = await Http.getInstance().get('/banner/json');
    HomeBanner banner = HomeBanner.fromJson(response.data);
    if (banner.dataList != null) {
      bannerData = banner.dataList;
    } else {
      bannerData = [];
    }

    // 通知监听器有变化
    notifyListeners();
  }
}
