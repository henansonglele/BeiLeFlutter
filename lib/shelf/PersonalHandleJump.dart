

import 'package:gx_flutter/common/DDPlatformManager.dart';
import 'package:gx_flutter/util/FlutterConsts.dart';

class PersonalHandlerJump {
  ///登录
  static void jumpLogin() {
    DDPlatformManager.open(SKIP_LOGIN);
  }
  
  ///我的足迹
  static void jumpMyFootList( ) {
    {
      DDPlatformManager.open(SKIP_PERSONAL_MY_FOOT);
    }
  }
  

  ///单品
  static void jumpBookDetail(String productId, String saleId) {
    Map<String, dynamic> params = {"title": "单品页", "url": "https://www.baidu.com"};
    DDPlatformManager.open(SKIP_BOOK_DETAIL, urlParams: params, exts: params);
  }

  
}
