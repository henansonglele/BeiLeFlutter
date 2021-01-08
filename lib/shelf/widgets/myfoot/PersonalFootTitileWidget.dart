

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../PersonalHandleJump.dart';
import '../../ShelfMainBloc.dart';

///个人中心 足迹 title 样式
class PersonalFootTitleWidget extends StatelessWidget {
  ShelfMainBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return getContent(context);
  }
  Widget getContent(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                "我的足迹",
                maxLines: 1,
                style:TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),),),

            Row(
              children: <Widget>[
                Container(
                  child: Text(
                    "查看全部",
                    maxLines: 1,
                    style:TextStyle(
                      fontSize: 12,
                      color: Color(0xff666666),
                    ),),),

                Image.asset(
                  "images/arrow@3x.png",
                  width: 13,
                  height: 13,
                )
              ],
            ),



          ],
        ),
      ),
      onTap: (){
        PersonalHandlerJump.jumpMyFootList();
      },
    );
  }
}
