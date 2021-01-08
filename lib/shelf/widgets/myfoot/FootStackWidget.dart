import 'package:flutter/cupertino.dart';
import 'package:gx_flutter/shelf/model/FootListNew.dart';

import '../../ShelfMainBloc.dart';
import 'DataParseHelper.dart';


///足迹带icon
class FootStackWidget extends StatelessWidget {
  final Product product;
  FootStackWidget(this.product);
  ShelfMainBloc bloc;
  num itemW = 62.0;
  num itemH = 88.0;
  
  @override
  Widget build(BuildContext context) {
    if(product == null )
      return Container();
    return Container(
      width: itemW,
      height: itemH,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
              child: Container(
                width: 62,
                height: 88,
                child: Image.network(
                  getFootListOneItemCover(),
                  width: 62,
                  height: 88,
                  fit: BoxFit.fill,
                ),
              )
          ),
          ///type tag
          getTypeTag()!=null?Positioned(
            top: 0,
            left: itemW-40,
            child: Image.asset(
              getTypeTag(),
              width: 40,
              height: 20,
              fit: BoxFit.fill,
            ),
          ):Container(),
          ///listen tag
        DataParseHelper.isListen(product.footprintType)?
          Positioned(
            top: itemH - 30,
            left: 0,
            child: Image.asset(
              "images/audio_book_tag.png",
              width: 20,
              height: 20,
              fit: BoxFit.fill,
            ),
          ):Container(),
          ///优惠tag
          getPromotionTagUrl()!=null?Positioned(
            top: 0,
            left: itemW-40,
            child: Image.network(
              getPromotionTagUrl(),
              width: 40,
              height: 30,
              fit: BoxFit.fill,
            ),
          ):Container(),
          ///企业tag
          isCompanyBook()? Positioned(
            top: 0,
            left: itemW-40,
            child: Image.asset(
              "images/company_flag.png",
              width: 40,
              height: 20,
              fit: BoxFit.fill,
            ),
          ):Container(),
        ],
      ),
    );
  }
  ///根据类型获取足迹cover
  String  getFootListOneItemCover( ){
    String type = product.footprintType;
    if (DataParseHelper.isPaper(type)) {
      return  product.paperVo.mediaList[0].coverPic;
    } else if (DataParseHelper.isWish(type)) {
      return product.wishVo.mediaInfo.coverPic;
    } else if (DataParseHelper.isBookStall(type)) {
      return  product.bookstallVo.mediaInfo.coverPic;
    } else {
      return  product.mediaVo.mediaList[0].coverPic;
    }
  }
  ///根据类型获取足迹cover
  String  getTypeTag( ){
    String type = product.footprintType;
     if (DataParseHelper.isWish(type)) {
      return "images/foot_print_tag_wish.png";
    } else if (DataParseHelper.isBookStall(type)) {
      return  "images/foot_print_tag_book_stall.png";
    }else{
       return null;
     }
  }

  ///优惠tag
  String getPromotionTagUrl(){
    String type = product.footprintType;
    if (DataParseHelper.isWish(type) || DataParseHelper.isBookStall(type)) {
      return  null;
    } else if (DataParseHelper.isPaper(type)) {
      if(product.paperVo.mediaList[0].promotionList ==null|| product.paperVo.mediaList[0].promotionList.isEmpty)
        return null;
      return  product.paperVo.mediaList[0].promotionList[0].promotionPic;
    }  else  {
      if(product.mediaVo.mediaList[0].promotionList == null || product.mediaVo.mediaList[0].promotionList.isEmpty)
        return null;
      return  product.mediaVo.mediaList[0].promotionList[0].promotionPic;
    }
  }

  ///是否是 企业标签
  bool isCompanyBook(){
    String type = product.footprintType;
    if (DataParseHelper.isWish(type) || DataParseHelper.isBookStall(type)) {
      return  false;
    } else if (DataParseHelper.isPaper(type)) {
      return false;
    }  else  {
      if(product.mediaVo == null || product.mediaVo.mediaList==null || product.mediaVo.mediaList.isEmpty){
        return false;
      }
      return  product.mediaVo.mediaList[0].isCompanyBook == 1;
    }
  }
  

}
