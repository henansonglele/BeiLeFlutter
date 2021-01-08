
import 'package:gx_flutter/http/GXApiTestInfo.dart';
import 'package:gx_flutter/http/Result.dart';
import 'package:gx_flutter/shelf/model/FootListNew.dart';
import 'package:gx_flutter/util/Pair.dart';

class JsonToBeanFactory {
  static var _factoryList = [
    Pair(GXApiTestInfo, (json) => GXApiTestInfo.fromJson(json)),
    Pair(Result, (json) => Result.fromJson(json)),
    Pair(FootListNew, (json) => FootListNew.fromJson(json)),
//   Pair
  ];

  static var _factoryMap = Map();

  static void init() {
    _factoryList.forEach((item) {
      Type type = item.first;
      if (_factoryMap.containsKey(type.toString())) {
        throw "Conflict class name ${item.first}";
      }

      _factoryMap[type.toString()] = item.second;
    });
  }

  /// 根据字符串类型名称转换json到Bean
  static dynamic fromJsonByType(String type, Map<String, dynamic> json) {
    if (_factoryMap.containsKey(type)) {
      return _factoryMap[type](json);
    }

    throw "Class $type cannot be create, need add factory to JsonToBeanFactory._factoryList";
  }

  /// 根据泛型参数类型，转换json到Bean
  static T fromJson<T>(Map<String, dynamic> json) {
    if (json is T) {
      return json as T;
    }

    return fromJsonByType(T.toString(), json);
  }
}
