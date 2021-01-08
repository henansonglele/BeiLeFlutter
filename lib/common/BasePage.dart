import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gx_flutter/util/DDToastUtils.dart';
import 'package:gx_flutter/util/LoadingUtil.dart';

import '../main.dart';
import 'DDPlatformManager.dart';
import 'bloc/DDBloc.dart';

abstract class BasePage<T extends DDBloc> extends StatelessWidget {
  final List<BuildContext> _contexts = List(1);

  @override
  Widget build(BuildContext context) {
    _contexts[0] = context;

    return NotificationListener<PageNotification>(
      child: BlocProvider<T>(
        create: createBloc,
        child: _ContentWidget<T>(this),
      ),
      onNotification: (notification) {
        if (notification is ToastPageNotification) {
          showToast(notification.msg);
        } else if (notification is ShowLoadingNotification) {
          showLoading();
        } else if (notification is HideLoadingNotification) {
          hideLoading();
        } else if (notification is OpenNotification) {
          open(notification.pageUrl,
              urlParams: notification.urlParams, exts: notification.exts);
        }

        return true;
      },
    );
  }

  /// 提供一个Bloc作为页面的控制器
  T createBloc(BuildContext context) => null;

  /// 创建页面内容
  Widget createContent(BuildContext context) => null;

  // ---------------------------------------------------------------------------
  // 以下是提供页面内使用的功能方法
  // 通过冒泡方式调用的方法也会最终调用到这里
  void hideLoading() {
    LoadingUtil.hideLoading(_contexts[0]);
  }

  void showLoading() {
    LoadingUtil.showLoading(_contexts[0]);
  }

  void showToast(String msg) {
    DDToastUtils.showToast(msg: msg);
  }

  Future<dynamic> open(String pageUrl,
      {Map<String, dynamic> urlParams, Map<String, dynamic> exts}) {
    if (justRunFlutter) {
      return Navigator.of(_contexts[0])
          .pushNamed(pageUrl, arguments: urlParams);
    } else {
      return DDPlatformManager.open(pageUrl, urlParams: urlParams, exts: exts);
    }
  }

  Future<bool> close({Map<String, dynamic> result, Map<String, dynamic> exts}) {
    if (justRunFlutter) {
      Navigator.of(_contexts[0]).pop(result);
      return Future.value(true);
    } else {
      return DDPlatformManager.close(_contexts[0], result: result, exts: exts);
    }
  }

  // ---------------------------------------------------------------------------
}

class _ContentWidget<T extends DDBloc> extends StatelessWidget {
  final BasePage _route;

  _ContentWidget(this._route);

  @override
  Widget build(BuildContext context) {
    return _route.createContent(context);
  }
}

void sendShowToast(BuildContext context, String msg) {
  ToastPageNotification(msg).dispatch(context);
}

void sendShowLoading(BuildContext context) {
  ShowLoadingNotification().dispatch(context);
}

void sendHideLoading(BuildContext context) {
  HideLoadingNotification().dispatch(context);
}

void sendOpen(BuildContext context, String pageUrl,
    {Map<String, dynamic> urlParams, Map<String, dynamic> exts}) {
  OpenNotification(pageUrl, urlParams: urlParams, exts: exts).dispatch(context);
}

class PageNotification extends Notification {}

class ToastPageNotification extends PageNotification {
  final String msg;

  ToastPageNotification(this.msg);
}

class ShowLoadingNotification extends PageNotification {}

class HideLoadingNotification extends PageNotification {}

class OpenNotification extends PageNotification {
  String pageUrl;
  Map<String, dynamic> urlParams;
  Map<String, dynamic> exts;
  OpenNotification(this.pageUrl, {this.urlParams, this.exts});
}
