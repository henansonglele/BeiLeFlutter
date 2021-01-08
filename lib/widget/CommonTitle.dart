import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gx_flutter/common/DDPlatformManager.dart';

class CommonTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  //右侧图片按钮路径（本地路径)demo: images/share_back.png
  final String rightImgBtnUrl;

  //右侧图片按钮点击回调函数
  final Function rightFunction;

  final Function leftFunction;

  final List<String> rightBtnUrlList;

  final List<Function> functionList;

  final String leftImgBtnUrl;

  //是否隐藏 左按钮
  final bool isHideLeftBtn;

  CommonTitle(
      {Key key,
      this.title = "",
      this.rightImgBtnUrl,
      this.rightFunction,
      this.leftImgBtnUrl = "",
      this.leftFunction,
      this.functionList,
      this.isHideLeftBtn,
      this.rightBtnUrlList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> btnList = List();
    if (rightImgBtnUrl != null && rightImgBtnUrl.isNotEmpty) {
      btnList.add(_RightBtn(
        key: Key("rightBtn"),
        imgUrl: rightImgBtnUrl,
        function: rightFunction,
        showPadding: true,
      ));
    }
    if (rightBtnUrlList != null && rightBtnUrlList.length > 0) {
      for (int i = 0; i < rightBtnUrlList.length; i++) {
        btnList.add(_RightBtn(
          key: Key("rightBtn" + i.toString()),
          imgUrl: rightBtnUrlList[i],
          function: functionList != null && functionList.length > i
              ? functionList[i]
              : null,
          showPadding: i == rightBtnUrlList.length - 1,
        ));
      }
    }
    return PreferredSize(
      child: AppBar(
        leading: (isHideLeftBtn != null && isHideLeftBtn)
            ? Container(width: 0, height: 0)
            : IconButton(
                icon: ImageIcon(AssetImage(leftImgBtnUrl.isEmpty ? 'images/btn_arrow_back@3x.png' : leftImgBtnUrl)),
                onPressed: leftFunction == null
                    ? () => DDPlatformManager.close(context)
                    : leftFunction,
              ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff444444),
            fontSize: 17.0,
          ),
        ),
        actions: btnList,
        centerTitle: true,
      ),
      preferredSize: Size.fromHeight(44.0),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(44.0);
}

class _RightBtn extends StatelessWidget {
  final String imgUrl;
  final Function function;
  final bool showPadding;

  const _RightBtn({Key key, this.imgUrl, this.function, this.showPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: showPadding ? 10 : 0),
      child: IconButton(
        iconSize: 22,
        icon: ImageIcon(AssetImage(imgUrl)),
        onPressed: function,
      ),
    );
  }
}
