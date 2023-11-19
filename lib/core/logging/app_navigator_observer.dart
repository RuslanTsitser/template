import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_logger.dart';

class AppNavigatorObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    logAppRouter('PUSH\n'
        'New route: ${route.settings.name}\n'
        'Previous route: ${previousRoute?.settings.name}');
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    logAppRouter('POP\n'
        'New route: ${previousRoute?.settings.name}\n'
        'Popped route: ${route.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    logAppRouter('REPLACE\n'
        'New route: ${newRoute?.settings.name}\n'
        'Replaced route: ${oldRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    logAppRouter('Route removed\n'
        'Removed route: ${route.settings.name}\n'
        'Previous route: ${previousRoute?.settings.name}');
    super.didRemove(route, previousRoute);
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logAppRouter('Tab route visited\n'
        'New route: ${route.name}\n'
        'Previous route: ${previousRoute?.name}');
    super.didInitTabRoute(route, previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logAppRouter('Tab route re-visited\n'
        'New route: ${route.name}\n'
        'Previous route: ${previousRoute.name}');
    super.didChangeTabRoute(route, previousRoute);
  }
}
