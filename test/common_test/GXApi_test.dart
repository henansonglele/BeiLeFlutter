import 'package:flutter_test/flutter_test.dart';
import 'package:gx_flutter/http/GXApi.dart';
import 'package:gx_flutter/http/GXApiMockUtil.dart';
import 'package:gx_flutter/http/GXApiTestInfo.dart';
import '../test_base.dart';

void main() {
  final String getPath = "path1";
  final String postPath = "path2";

  TestWidgetsFlutterBinding.ensureInitialized();
  commonSetupAll();

  void _setGetMethodReturnValue() {
    // 指定一个接口的默认返回数据，isLogin为false
    var methodReturnJson = """{"status":{"code":0},"data":{"isLogin":false}}""";
    GXApiMockUtil.addGet(getPath, methodReturnJson);
  }

  void _setPostMethodReturnValue() {
    // 指定一个接口的默认返回数据，isLogin为false
    var methodReturnJson = """{"status":{"code":0},"data":{"isLogin":false}}""";
    GXApiMockUtil.addPost(postPath, methodReturnJson);
  }

  /// get请求测试
  var gxApiMockJson = """{"status":{"code":0},"data":{"isLogin":true}}""";
  test("get请求未指定mock返回接口值", () async {
    _setGetMethodReturnValue();
    var ret = await GXApi.get<GXApiTestInfo>(getPath).first;

    print("======================== 1");

    expect(ret.data.isLogin, false);
  });

  test("get请求指定path的mock返回模拟值", () async {
    GXApiMockUtil.addGet(getPath, gxApiMockJson);

    var ret = await GXApi.get<GXApiTestInfo>(getPath).first;

    print("======================== 2");

    expect(ret.data.isLogin, true);
  });

  test("删除get请求对应path的mock返回接口值", () async {
    GXApiMockUtil.addGet(getPath, gxApiMockJson);

    var ret = await GXApi.get<GXApiTestInfo>(getPath).first;
    expect(ret.data.isLogin, true);

    GXApiMockUtil.removeGet(getPath);

    _setGetMethodReturnValue();

    print("======================== 3");

    ret = await GXApi.get<GXApiTestInfo>(getPath).first;

    expect(ret.data.isLogin, false);
  });

  test("clear所有get请求mock返回接口值", () async {
    GXApiMockUtil.addGet(getPath, gxApiMockJson);

    var ret = await GXApi.get<GXApiTestInfo>(getPath).first;
    expect(ret.data.isLogin, true);

    GXApiMockUtil.clearGet();

    print("======================== 4");
    _setGetMethodReturnValue();

    ret = await GXApi.get<GXApiTestInfo>(getPath).first;

    expect(ret.data.isLogin, false);
  });

  /// post请求测试
  test("post请求未指定mock返回接口值", () async {
    _setPostMethodReturnValue();
    var ret = await GXApi.post<GXApiTestInfo>(postPath).first;

    print("======================== 5");

    expect(ret.data.isLogin, false);
  });

  test("post请求指定path的mock返回模拟值", () async {
    GXApiMockUtil.addPost(postPath, gxApiMockJson);

    var ret = await GXApi.post<GXApiTestInfo>(postPath).first;

    print("======================== 6");

    expect(ret.data.isLogin, true);
  });

  test("删除post请求对应path的mock返回接口值", () async {
    GXApiMockUtil.addPost(postPath, gxApiMockJson);

    var ret = await GXApi.post<GXApiTestInfo>(postPath).first;
    expect(ret.data.isLogin, true);

    GXApiMockUtil.removePost(postPath);

    _setPostMethodReturnValue();

    print("======================== 7");

    ret = await GXApi.post<GXApiTestInfo>(postPath).first;

    expect(ret.data.isLogin, false);
  });

  test("clear所有post请求mock返回接口值", () async {
    GXApiMockUtil.addPost(postPath, gxApiMockJson);

    var ret = await GXApi.post<GXApiTestInfo>(postPath).first;
    expect(ret.data.isLogin, true);

    GXApiMockUtil.clearPost();

    print("======================== 8");
    _setPostMethodReturnValue();

    ret = await GXApi.post<GXApiTestInfo>(postPath).first;

    expect(ret.data.isLogin, false);
  });
}

