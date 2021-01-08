
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../PersonalHandleJump.dart';
import '../../ShelfMainBloc.dart';
import 'FootStackWidget.dart';
import 'PersonalFootTitileWidget.dart';

///个人中心 足迹
class PersonalFootListWidget extends StatelessWidget {
  ShelfMainBloc bloc;
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return getContent(context);
  }

  Widget getContent(BuildContext context) {
    if (bloc.getFootItemSize()==0) {
      return Container();
    } else {
      return Container(
        margin: EdgeInsets.only(top:8,left: 14, right: 14),
        height: 600.0,
        child: Column(
          children: <Widget>[
            PersonalFootTitleWidget(),
            getFootList(context),
          ],
        ),
      );
    }
  }

  Widget getFootList(BuildContext context) {
    return Container(
      alignment:Alignment.centerLeft,
      height: 500.0,
        child: ListView.builder(
          cacheExtent: MediaQuery.of(context).size.width - 30,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: bloc.getFootItemSize(),
          itemBuilder: (context, index) {
            return getFootListItem(index);
          },
        ),
    );
  }

  Widget getFootListItem(int index) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: FootStackWidget(bloc.getfootOneProduct(index)),
              onTap: () {
                PersonalHandlerJump.jumpBookDetail( bloc.getFootListOneItemId(index),  bloc.getFootListOneItemTitile(index));
              }),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 11),
              width: 62,
              height: 20,
              child: Text(
                bloc.getFootListOneItemTitile(index),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xff333333),
                ),
              ),
            ),
            onTap: () {
              PersonalHandlerJump.jumpBookDetail( bloc.getFootListOneItemId(index),  bloc.getFootListOneItemTitile(index));
            },
          ),
        ],
      ),
    );
  }
}
