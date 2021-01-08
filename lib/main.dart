import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:gx_flutter/RouteMap.dart';
import 'package:gx_flutter/common/DDCommonStyle.dart';
import 'package:gx_flutter/common/DDPlatformManager.dart';
import 'package:gx_flutter/common/JsonToBeanFactory.dart';
import 'package:gx_flutter/common/bloc/DDBlocObserver.dart';

// 当App运行在Release环境时，isRelease为true；当App运行在Debug和Profile环境时，isRelease为false。
const bool isRelease = const bool.fromEnvironment("dart.vm.product");
bool isTest = false; // 当执行UT时会指定为true
Map<String, PageBuilder> _pageBuilders;
bool justRunFlutter = false;  // 不依赖原生工程直接执行Flutter代码

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails details) {
    DDPlatformManager.reportError(details);
  };

  Bloc.observer = DDBlocObserver();
  DDPlatformManager.init();

  runZoned(
    () => runApp(MyApp()),
    zoneSpecification: null,
    onError: (Object obj, StackTrace stack) {
      reportError(obj, stack);
    },
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    initTheme();

    JsonToBeanFactory.init();

    ///register page widget builders,the key is pageName
    initPageBuilders();
  }

  void initPageBuilders() {
    _pageBuilders = getPageBuilderMap();
    FlutterBoost.singleton.registerPageBuilders(_pageBuilders);
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Boost example',
        builder: FlutterBoost.init(),
        onGenerateRoute: null,

        ///init container manager
        home: Center(),
      );
}

void reportError(Object obj, StackTrace stack) {
  FlutterErrorDetails details =
      FlutterErrorDetails(exception: obj, stack: stack);
  DDPlatformManager.reportError(details);
}
