

import 'package:gx_flutter/main.dart';

class DDMethodChannelMockUtil {
  static List<MethodCallMockInfo> methodMockList;

  /// 调用原生方法返回数据模拟
  static void add(MethodCallMockInfo mockInfo) {
    if (isRelease) {
      return;
    }

    if (methodMockList == null) {
      methodMockList = List();
    }

    methodMockList.add(mockInfo);
  }

  /// 删除指定mock
  static void remove(MethodCallMockInfo mockInfo) {
    methodMockList.remove(mockInfo);
  }

  static void removeWhere(bool test(MethodCallMockInfo mockInfo)) {
    methodMockList?.removeWhere(test);
  }

  /// 清除所有mock
  static void clear() {
    methodMockList?.clear();
  }
}

/// 判断是否需要对指定的调用进行mock
typedef bool MockTest(String method, dynamic arguments);

class MethodCallMockInfo {
  String key;
  MockTest mockTest;
  dynamic returnData;

  MethodCallMockInfo(this.mockTest, this.returnData, {this.key});
}