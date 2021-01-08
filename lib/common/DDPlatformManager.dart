
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:gx_flutter/common/DDEventBus.dart';
import 'package:gx_flutter/common/DDMethodChannel.dart';


class DDPlatformManager {
  static DDMethodChannel _ddMethodChannel;
  
  static void init() {
    _ddMethodChannel = DDMethodChannel(const MethodChannel('ddreader/common_channel'));
    DDEventBus.init();
  }

  /// 跳转原生页面，Flutter页面也通过跳转原生页面加载
  static Future<Map<dynamic, dynamic>> open(String pageUrl,
      {Map<String, dynamic> urlParams, Map<String, dynamic> exts}) {
    return FlutterBoost.singleton
        .open(pageUrl, urlParams: urlParams, exts: exts);
  }

  /// 关闭当前页
  static Future<bool> close(BuildContext context,
      {Map<String, dynamic> result, Map<String, dynamic> exts}) {
    BoostContainerSettings settings = BoostContainer.of(context).settings;
    return FlutterBoost.singleton
        .close(settings.uniqueId, result: result, exts: exts);
  }

  /// 异步调用原生方法
  static Future<T> invokeMethod<T>(String method, [dynamic arguments]) async {
    return _ddMethodChannel.invokeMethod<T>(method, arguments);
  }

  static Future<T> invokeTestMethod<T>([dynamic arguments]) async {
    return _ddMethodChannel.invokeMethod<T>("ddreader/test", arguments);
  }

  /// 设置原生调用flutter指定方法的处理函数
  static void setMethodCallHandler(String method, MethodCallHandler handler) {
    _ddMethodChannel.setMethodCallHandler(method, handler);
  }

  /// 删除原生调用flutter方法的回调
  static void removeMethodCallHandler(String method) {
    _ddMethodChannel.removeMethodCallHandler(method);
  }

  /// 原生调用flutter打印参数
  static nPrint ([dynamic arguments]) {
    return _ddMethodChannel.invokeMethod("ddreader/nativePrint", arguments);
  }

  /// 通知原生平台发生异常，原生平台通过友盟上报
  static void reportError(FlutterErrorDetails details) {
    // 过滤不需要上报的第三方异常
    if (details.stack.toString().contains(
        "package:flutter_easyrefresh/src/footer/load_indicator.dart:631")) {
      return;
    }

    FlutterErrorDetails reportDetails = FlutterErrorDetails(
      exception: details.exception,
      stack: details.stack,
      library: details.library,
      context: details.context,
      stackFilter: details.stackFilter,
      informationCollector: () sync* {
        BoostContainerSettings settings =
            FlutterBoost.containerManager?.onstageSettings;
        var msg = "Top page : ${settings.name}" "Top page : ${settings.name}\n";
        msg += "Foreground : ${FlutterBoost.containerManager?.foreground}";
        yield ErrorDescription(msg);
      },
      silent: details.silent,
    );

    invokeMethod("ddreader/reportError", reportDetails.toString())
        .whenComplete(() => print('Report error: ${reportDetails.toString()}'))
        .catchError((e) => print(e));
  }
}
