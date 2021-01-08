import 'dart:collection';

import 'package:flutter_boost/flutter_boost.dart';
import 'package:gx_flutter/main.dart';
import 'package:gx_flutter/shelf/ShelfMainPage.dart';
import 'package:gx_flutter/util/FlutterConsts.dart';
/// Flutter对外的路由表统一在这里维护

var routeMap = {
  //书架
  OPEN_SHELF_MAIN: RouteInfo((pageName, params, _) => ShelfMainPage()),

};

var testRouteMap = {
//  'ddflutter://recommend/RecommendBlocRoute': RouteInfo((pageName, params, _) => RecommendBlocRoute(), "我是埋点page_id"),

};

Map<String, PageBuilder> getPageBuilderMap() {
  Map<String, PageBuilder> builders = HashMap();
  routeMap.forEach((k, v) {
    builders[k] = v.builder;
  });

  // 测试环境添加测试页面路由
  if (!isRelease) {
    testRouteMap.forEach((k, v) {
      builders[k] = v.builder;
    });
  }
  return builders;
}

class RouteInfo {
  PageBuilder builder;
  String pageId;

  RouteInfo(this.builder, [this.pageId]);
}
