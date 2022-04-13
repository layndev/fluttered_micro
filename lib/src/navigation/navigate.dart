import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Navigate {
  
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Navigate._();
  static final Navigate to = Navigate._();
  factory Navigate() => to;

  void pushNamed(String routeName, {Object arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String routeName, bool Function(Route<dynamic>) predicate, {Object arguments}) {
    navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pushReplacementNamed(String routeName, {Object arguments}) {
    navigatorKey.currentState?.pushReplacementNamed(routeName, arguments: arguments);
  }

  void popAndPushNamed<TO extends Object>(String routeName, {TO result, Object arguments}) {
    navigatorKey.currentState?.popAndPushNamed(routeName, result: result, arguments: arguments);
  }

  void pop<TO extends Object>([TO result]) {
    navigatorKey.currentState?.pop(result);
  }

}