
import 'package:gx_flutter/common/DDPlatformManager.dart';

/// 原生日志打印
class LogUtils {
  static void i(String msg, {String tag}) {
    _log("i", tag, msg);
  }

  static void w(String msg, {String tag}) {
    _log("w", tag, msg);
  }

  static void v(String msg, {String tag}) {
    _log("v", tag, msg);
  }

  static void d(String msg, {String tag}) {
    _log("d", tag, msg);
  }

  static void e(String msg, {String tag}) {
    _log("e", tag, msg);
  }

  static void _log(String type, String tag, String msg) {
    DDPlatformManager.invokeMethod("ddreader/log", {"type": type, "tag": tag, "msg": msg});
  }
}