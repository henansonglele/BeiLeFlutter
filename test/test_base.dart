

import 'package:flutter/material.dart';
import 'package:gx_flutter/common/DDPlatformManager.dart';
import 'package:gx_flutter/common/JsonToBeanFactory.dart';
import 'package:gx_flutter/common/bloc/DDBloc.dart';
import 'package:gx_flutter/main.dart';

/// 通用测试环境初始化
void commonSetupAll() {
  isTest = true;
  DDPlatformManager.init();
  JsonToBeanFactory.init();
}

Future getOneStateSkipInit(DDBloc bloc) {
  return bloc.state.skipWhile((it) => it.runtimeType == bloc.initState.runtimeType).first;
}

Future getOneState(DDBloc bloc) {
  return bloc.state.first;
}

class TestApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget homePage;


  TestApp(this.homePage);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: homePage,
    );
  }
}