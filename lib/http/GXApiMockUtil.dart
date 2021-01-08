import 'package:gx_flutter/util/InvokeMethodConsts.dart';
import '../common/DDMethodChannelMockUtil.dart';

class GXApiMockUtil {
  static const GXAPI_GET_MOCK_PREFIX = "get_";
  static const GXAPI_POST_MOCK_PREFIX = "post_";

  static void addGet(String path, String returnJson) {
    DDMethodChannelMockUtil.add(MethodCallMockInfo((method, args) {
      if (method == METHOD_GXAPI_GET &&
          args != null &&
          args is Map &&
          path == args["path"]) {
        return true;
      }

      return false;
    }, returnJson, key: "$GXAPI_GET_MOCK_PREFIX$path"));
  }

  static void removeGet(String path) {
    DDMethodChannelMockUtil.removeWhere((it) => it.key == "$GXAPI_GET_MOCK_PREFIX$path");
  }

  static void clearGet() {
    DDMethodChannelMockUtil.removeWhere((it) => it.key.startsWith(GXAPI_GET_MOCK_PREFIX));
  }

  static void addPost(String path, String returnJson) {
    DDMethodChannelMockUtil.add(MethodCallMockInfo((method, args) {
      if (method == METHOD_GXAPI_POST &&
          args != null &&
          args is Map &&
          path == args["path"]) {
        return true;
      }

      return false;
    }, returnJson, key: "$GXAPI_POST_MOCK_PREFIX$path"));
  }

  static void removePost(String path) {
    DDMethodChannelMockUtil.removeWhere((it) => it.key == "$GXAPI_POST_MOCK_PREFIX$path");
  }

  static void clearPost() {
    DDMethodChannelMockUtil.removeWhere((it) => it.key.startsWith(GXAPI_POST_MOCK_PREFIX));
  }
}
