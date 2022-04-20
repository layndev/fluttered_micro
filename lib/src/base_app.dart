import 'package:flutter/material.dart';

import 'module/module.dart';
import 'navigation/widget_builder_args.dart';

abstract class BaseApp {

  List<Module> get modules;
  Map<String, WidgetBuilderArgs> get baseRoutes;
  final Map<String, WidgetBuilderArgs> routes = {};

  void registerRoutes() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (modules.isNotEmpty) {
      for (Module m in modules) {
        routes.addAll(m.routes);
      }
    }
  }

  void registerInjection() {
    if (modules.isNotEmpty) {
      for (Module m in modules) {
        m.injectionRegister();
      }
    }
  }

  void registerListener() {
    if (modules.isNotEmpty) {
      for (Module m in modules) {
        m.createListener();
      }
    }
  }

  Route<dynamic>? onGenerateRoute(RouteSettings routerSettings) {
    var routerName = routerSettings.name;
    var routerArgs = routerSettings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) {
        return navigateTo(context, routerArgs);
      },
    );
  }

  String get initialRoute => '/';
}