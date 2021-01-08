import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gx_flutter/common/BasePage.dart';
import 'package:gx_flutter/common/bloc/DDBlocBuilder.dart';
import 'package:gx_flutter/shelf/widgets/myfoot/PersonalFootListWidget.dart';
import 'ShelfMainBloc.dart';

class ShelfMainPage extends BasePage<ShelfMainBloc> {
  ShelfMainPage();
  ShelfMainBloc bloc;
  ShelfMainBloc createBloc(BuildContext context) {
    return ShelfMainBloc();
  }

  
  @override
  Widget createContent(BuildContext context) {
    bloc = BlocProvider.of<ShelfMainBloc>(context);
    bloc.initData();

    return Scaffold(
        backgroundColor: Color(0xffffffff),
        body:
            DDBlocBuilder<ShelfMainBloc, dynamic>(builder: (context, state) {
          Widget content;

          return  PersonalFootListWidget();
        }));
  }
}
