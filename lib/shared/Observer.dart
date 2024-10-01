import 'package:bmp_music/shared/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyRouteObserver extends GetObserver {
  final WidgetRef ref;

  MyRouteObserver({required this.ref});

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    print('Navigated to ${route.settings.name}');
    Future.delayed(const Duration(milliseconds: 300), () {
      ref
          .read(routerControllerProvider.notifier)
          .change(route.settings.name ?? '');
    });

    // Get.find<RouterController>().increment(route.settings.name ?? '');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    print('Returned to ${previousRoute?.settings.name}');
    Future.delayed(const Duration(milliseconds: 300), () {
      ref
          .read(routerControllerProvider.notifier)
          .change(previousRoute?.settings.name ?? '');
    });
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    print(
        'Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    print('Removed ${route.settings.name}');
  }
}
