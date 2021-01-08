

import 'package:gx_flutter/common/DDPlatformManager.dart';

import 'FlutterConsts.dart';

/// 原生toast
class DDToastUtils {
  static void showToast({String msg}) {
    final Map<String, dynamic> params = <String, dynamic>{
      'msg': msg
    };
    DDPlatformManager.invokeMethod(METHOD_ShowToast, params);
  }
}