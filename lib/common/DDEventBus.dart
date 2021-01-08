import 'dart:convert';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/services.dart';
import 'package:gx_flutter/common/DDPlatformManager.dart';
import 'package:gx_flutter/common/JsonToBeanFactory.dart';

class DDEventBus {
  static const String _DD_EVENT_BUS_POST_METHOD_NAME = "ddreader/event_bus_post";

  static EventBus _eventBus = EventBus();

  static void init() {
    DDPlatformManager.setMethodCallHandler(
        _DD_EVENT_BUS_POST_METHOD_NAME, _onEvent);
  }

  static Future<dynamic> _onEvent(MethodCall call) async {
    var args = call.arguments;
    var event = JsonToBeanFactory.fromJsonByType(
        args["name"], json.decode(args["event"]));

    _eventBus.fire(event);
  }

  static Stream<T> on<T>() {
    return _eventBus.on<T>();
  }

  static void fire(event) {
    _eventBus.fire(event);
    DDPlatformManager.invokeMethod(
        _DD_EVENT_BUS_POST_METHOD_NAME, {"event": json.encode(event), "name": event.runtimeType.toString()});
  }
}


