import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';

import 'DDPlatformManager.dart';

String defaultFontFamily = "default_blue_font";

InitFontState _initFontState = InitFontState.START;

enum InitFontState { START, LOADING, FINISH }

void initTheme() {
  initFont();
}

void initFont() {
  if (_initFontState != InitFontState.START) {
    return;
  }

  _initFontState = InitFontState.LOADING;

  Stream.fromFuture(DDPlatformManager.invokeMethod<String>("ddreader/getTTFPath"))
      .asyncMap<void>((path) {
        if (path.length > 0) {
          var fontLoader = FontLoader(defaultFontFamily);
          var file = File(path);

          if (Platform.isIOS) {
            fontLoader = FontLoader(path);
            defaultFontFamily = path;
            return fontLoader.load();
          } else {
            fontLoader.addFont(file.readAsBytes().then((value) {
              return ByteData.view(Uint8List.fromList(value).buffer);
            }));
            print("Loading font: $path");
            return fontLoader.load();
          }
        } else {
          throw 'getTTFPath is null';
        }
      }).listen((s) {
        print('Load font success');
        _initFontState = InitFontState.FINISH;
      }, onError: (e) {
        print("Load font error: $e");
        _initFontState = InitFontState.START;

        // 应用第一次启动时字体可能还没有解压完成，做延后处理
        FlutterBoost.singleton.addBoostContainerLifeCycleObserver((state, setting) {
          if (state == ContainerLifeCycle.Init) {
            initFont();
          }
        });
      });
}
