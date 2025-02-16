import 'package:assistant/pages/home/bottom_tab_bar.dart';
import 'package:flutter/material.dart';

import '../pages/errors/page_not_found.dart';
import '../pages/business/talk.dart';

class Routes {
  // 路由map
  static final Map<String, Widget Function(RouteSettings)> _routes = {
    // "/": (settings) => BottomTabBar(),
    "/": (settings) => Talk(),
    "/talk": (settings) => Talk(),
    "/404": (settings) => PageNotFound(),
  };

  // 生成路由函数
  static Route<dynamic> genRoute(RouteSettings settings) {
    final routeBuilder = _routes[settings.name] ?? _routes["/404"];
    return pageRoute(routeBuilder!(settings), settings: settings);
  }

  // 疯转跳转路由
  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
    bool? barrierDismissible,
  }) {
    return MaterialPageRoute(
      builder: (context) => page,
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? true,
      allowSnapshotting: allowSnapshotting ?? true,
      barrierDismissible: barrierDismissible ?? true,
    );
  }
}
