
import 'dart:convert' as convert;

import 'package:gx_flutter/common/bloc/DDBloc.dart';
import 'package:gx_flutter/common/bloc/DDBlocStates.dart';
import 'package:gx_flutter/http/GXApi.dart';
import 'package:gx_flutter/shelf/widgets/myfoot/DataParseHelper.dart';

import 'model/FootListNew.dart';

class ShelfMainBloc extends DDBloc {

  ShelfMainBloc();
  FootListNew  footList;
  
  initData(){
    listtenFootPrintInfo();
  }

  void listtenFootPrintInfo() {
    
    getFootPrint().listen((_) {
      sendState(DDBlocStateDataChange(null));
    }, onError: (e, s) {
      print(e);
      print(s);
    });
  }

  ///获取足迹信息

  Stream<FootListNew> getFootPrint() {
    var data = {"action":"getFootprintList","pageSize": "10","token":"e_e36dd7d3515530394e71289a6cb7a4d38651b4d765c9446a0bbffc7b5400080a"};
    return GXApi.get<FootListNew>("http://e.dangdang.com/media/api2.go?", params: data)
        .map((result) {
      footList = result.data;
      return footList;
    });
  }

  num getFootItemSize() {
    if (footList == null ||
        footList.productList == null ||
        footList.productList.length == 0)
      return 0;
    else {
      return footList.productList.length;
    }
  }

  FootListNew getfootlis() {
    return footList;
  }

  Product getfootOneProduct(int index) {
    if (footList == null || footList.productList.isEmpty) return null;
    return footList.productList[index];
  }

  ///根据类型获取足迹title
  String getFootListOneItemTitile(int index) {
    String type = getfootlis().productList[index].footprintType;
    if (DataParseHelper.isPaper(type)) {
      return getfootlis().productList[index].paperVo.mediaList[0].title;
    } else if (DataParseHelper.isWish(type)) {
      return getfootlis().productList[index].wishVo.mediaInfo.title;
    } else if (DataParseHelper.isBookStall(type)) {
      return getfootlis().productList[index].bookstallVo.mediaInfo.title;
    } else {
      return getfootlis().productList[index].mediaVo.mediaList[0].title;
    }
  }
  ///根据类型获取足迹id
  String getFootListOneItemId(int index) {
    String type = getfootlis().productList[index].footprintType;
    if (DataParseHelper.isPaper(type)) {
      return getfootlis()
          .productList[index]
          .paperVo
          .mediaList[0]
          .mediaId
          .toString();
    } else if (DataParseHelper.isWish(type)) {
      return getfootlis()
          .productList[index]
          .wishVo
          .mediaInfo
          .mediaId
          .toString();
    } else if (DataParseHelper.isBookStall(type)) {
      return getfootlis()
          .productList[index]
          .bookstallVo
          .mediaInfo
          .mediaId
          .toString();
    } else {
      return getfootlis()
          .productList[index]
          .mediaVo
          .mediaList[0]
          .mediaId
          .toString();
    }
  }
}

