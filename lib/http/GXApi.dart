import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:gx_flutter/util/InvokeMethodConsts.dart';
import '../common/DDPlatformManager.dart';
import 'Result.dart';

/// 网络请求方式
enum GXApiMethod {
  get,
  post,
}

/// 网络请求工具
class GXApi {

  static Stream<Result<T>> get<T>(String path, {Map<String, dynamic> params}) {
    return _requestWithMethod(path, method: GXApiMethod.get, params: params);
  }

  static Stream<Result<T>> post<T>(String path, {Map<String, dynamic> params}) {
    return _requestWithMethod(path, method: GXApiMethod.post, params: params);
  }

  static Stream<Result<T>> _requestWithMethod<T>(String path, {GXApiMethod method, Map<String, dynamic> params}) {
    return _request(path, method: method, params: params)
        .asStream()
        .map((s) => Result<T>.fromJson(json.decode(s)))
        .map((result) {
      if (result.status != null && result.status.code == 0) {
        /// 返回成功，走正常处理流程
        return result;
      } else {
        /// 返回code不为0，直接将Result作为异常抛出
        throw result;
      }
    });
  }

  static Future<String> _request(String path, {GXApiMethod method, Map<String, dynamic> params}) async {
    Map<String, dynamic> queryMap = Map();
    if (params != null && params.isNotEmpty) {
      queryMap.addAll(params.map((k, v) => MapEntry(k, "$v")));
    }
    queryMap["path"] = path;
    queryMap["params"] = params;
    return DDPlatformManager.invokeMethod<String>(_getInvokeMethodName(method), queryMap);
  }

  /// 根据网络请求方式获取invokeMethodName
  static String _getInvokeMethodName(GXApiMethod method) {
    if (method == GXApiMethod.get) {
      return METHOD_GXAPI_GET;
    } else {
      return METHOD_GXAPI_POST;
    }
  }
}
