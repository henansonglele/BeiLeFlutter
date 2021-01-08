
import 'package:flutter/material.dart';
import 'package:flutter_boost/container/boost_container.dart';
import 'package:flutter_boost/flutter_boost.dart';
import 'package:gx_flutter/widget/ComonLoading.dart';

class LoadingUtil {
  static Set<String> _showLoadingPages = Set();

  static void showLoading(BuildContext context) {
    if (_isPageShowLoading(context)) {
      return;
    }

    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return WillPopScope(
          child: Center(
            child: CommonLoading(),
          ),
          onWillPop: () async {
            BoostContainer.of(context).performBackPressed();
            return Future.value(true);
          },
        );
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color(0x00000001),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    );

    BoostContainer.of(context).addLifeCycleObserver((state, setting) {
      if (state == ContainerLifeCycle.Destroy) {
        hideLoading(context);
      }
    });

    _setPageShowLoading(context);
  }

  static void hideLoading(BuildContext context) {
    if (_isPageShowLoading(context)) {
      Navigator.of(context, rootNavigator: true).pop();
      _removePageShowLoading(context);
    }
  }

  static bool _isPageShowLoading(BuildContext context) {
    return _showLoadingPages.contains(BoostContainer.of(context).uniqueId);
  }

  static void _setPageShowLoading(BuildContext context) {
    _showLoadingPages.add(BoostContainer.of(context).uniqueId);
  }

  static void _removePageShowLoading(BuildContext context) {
    _showLoadingPages.remove(BoostContainer.of(context).uniqueId);
  }

  static Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: child,
    );
  }
}

