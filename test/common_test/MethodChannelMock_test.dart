
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gx_flutter/common/DDMethodChannel.dart';
import 'package:gx_flutter/common/DDMethodChannelMockUtil.dart';
import 'package:mockito/mockito.dart';

class MethodChannelMock extends Mock implements MethodChannel {}

void main() {
  var info = MethodCallMockInfo(((i, t) => true), "aaaa", key: "aaa");

  group("mock的添加删除", () {
    test("添加Mock后列表中可见", () {
      expect(DDMethodChannelMockUtil.methodMockList, null);

      DDMethodChannelMockUtil.add(info);

      expect(DDMethodChannelMockUtil.methodMockList[0], info);
    });

    test("删除指定Mock后列表中删除", () {
      DDMethodChannelMockUtil.remove(info);

      expect(DDMethodChannelMockUtil.methodMockList.isEmpty, true);
    });

    test("使用条件删除后符合条件的mock被删除", () {
      DDMethodChannelMockUtil.add(info);
      expect(DDMethodChannelMockUtil.methodMockList[0], info);

      DDMethodChannelMockUtil.removeWhere((it) => it.key == "aaa");

      expect(DDMethodChannelMockUtil.methodMockList.isEmpty, true);
    });

    test("使用clear所有mock被删除", () {
      DDMethodChannelMockUtil.add(info);
      expect(DDMethodChannelMockUtil.methodMockList.isNotEmpty, true);

      DDMethodChannelMockUtil.clear();

      expect(DDMethodChannelMockUtil.methodMockList.isEmpty, true);
    });
  });

  group("mock的使用", () {
    var methodName = "testMethod";
    var methodReturnFromPlatform = "methodReturnFromPlatform";
    var methodChannelMock = MethodChannelMock();
    // 模拟DDMethodChannel中调用系统MethodChannel的返回
    when(methodChannelMock.invokeMethod<String>(methodName))
        .thenAnswer((_) => Future.value(methodReturnFromPlatform));
    var methodChannel = DDMethodChannel(methodChannelMock);

    test("有匹配的mock返回mock结果并将mock删除", () async {
      DDMethodChannelMockUtil.add(info);

      var returnData = await methodChannel.invokeMethod<String>(methodName);

      expect(returnData, info.returnData);
      expect(DDMethodChannelMockUtil.methodMockList.isEmpty, true);
    });

    test("没有mock返回真实调用结果", () async {
      var returnData = await methodChannel.invokeMethod<String>(methodName);

      expect(returnData, methodReturnFromPlatform);
    });

    test("没有匹配的mock返回真实调用结果", () async {
      var info1 = MethodCallMockInfo(((i, t) => false), "aaaa", key: "aaa");
      DDMethodChannelMockUtil.add(info1);

      var returnData = await methodChannel.invokeMethod<String>(methodName);

      expect(returnData, methodReturnFromPlatform);
    });

  });
}