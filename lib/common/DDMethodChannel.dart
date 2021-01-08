
import 'package:flutter/services.dart';
import 'package:gx_flutter/common/DDMethodChannelMockUtil.dart';
import 'package:gx_flutter/main.dart';


class DDMethodChannel {
  // 通用调用通道
  final MethodChannel _platformMethodChannel;
  Map<String, MethodCallHandler> _methodCallHandlers = Map();


  DDMethodChannel(this._platformMethodChannel) {
    _platformMethodChannel.setMethodCallHandler(_onMethodCall);
  }

  Future<dynamic> _onMethodCall(MethodCall call) async {
    MethodCallHandler handler = _methodCallHandlers[call.method];
    if (handler != null) {
      return handler(call);
    } else {
      throw "Cannot find method ${call.method} in flutter_module";
    }
  }

  /// 异步调用原生方法
  Future<T> invokeMethod<T>(String method, [ dynamic arguments ]) async {
    if (!isRelease) {
      var mock = DDMethodChannelMockUtil.methodMockList
          ?.firstWhere((it) => it.mockTest(method, arguments), orElse: () => null);
      if (mock != null) {
        DDMethodChannelMockUtil.remove(mock);  // mock被使用后就从列表中删除

        return Future<T>.value(mock.returnData);
      }
    }

    return _platformMethodChannel.invokeMethod<T>(method, arguments);
  }
  
  /// 设置原生调用flutter指定方法的处理函数
  void setMethodCallHandler(String method, MethodCallHandler handler) {
    _methodCallHandlers[method] = handler;
  }

  /// 删除原生调用flutter方法的回调
  void removeMethodCallHandler(String method) {
    _methodCallHandlers.remove(method);
  }
}

typedef Future<dynamic> MethodCallHandler(MethodCall call);