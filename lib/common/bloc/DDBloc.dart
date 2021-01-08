import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:gx_flutter/util/LogUtils.dart';

import 'DDBlocEvents.dart';
import 'DDBlocStates.dart';

abstract class DDBloc extends Bloc<dynamic, dynamic> {
  dynamic _initState;

  /// 默认初始状态为DDBlocStateLoading
  DDBloc({dynamic initialState}) : super(initialState ?? DDBlocStateLoading()) {
    _initState = initialState;
  }

  get initState => _initState;

  @override
  Stream<dynamic> mapEventToState(dynamic event) {
    if (event is DDBlocEventSendState) {
      return Stream.value(event.state);
    }

    Stream<dynamic> stream = handleEvent(event);

    return stream.transform(
        StreamTransformer.fromHandlers(handleError: (error, stackTrace, sink) {
          sink.add(error);  // 通过Bloc的输出流发送到UI模块
          LogUtils.e(stackTrace.toString());
        }));
  }

  /// 需要处理更多事件时需要实现这个方法
  Stream<dynamic> handleEvent(event) => null;


  /// 内部将一个对象作为state发送，不需要经过event转换
  void sendState(state) {
    this.add(DDBlocEventSendState(state));
  }

  ///是否是android 平台
  bool isAndroid(){
    if(Platform.isAndroid)
      return true;
    return false;
  }
  ///是否是ios 平台
  bool isIos(){
    if(Platform.isIOS)
      return true;
    return false;
  }
}
