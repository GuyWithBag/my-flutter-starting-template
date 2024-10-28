import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:room_monitoring_frontend/controllers/controllers.dart';

class NavigationController extends ChangeNotifier {
  String prevRoute = 'none';
  String prevPop = 'none';

  List<void Function(List<String> uriPathSegments)> onPopScopeListeners = [];
  List<void Function(List<String> uriPathSegments)> onGoListeners = [];

  void go(BuildContext context, String location) {
    GoRouter router = GoRouter.of(context);
    final provider = router.routeInformationProvider;
    final uri = provider.value.uri;
    prevRoute = uri.path;
    router.go(location);
    final appBar = context.read<AppBarController>();
    appBar.update();
    notifyListeners();
  }

  void pop(BuildContext context) {
    GoRouter router = GoRouter.of(context);
    // final appBar = context.read<AppBarController>();
    final provider = router.routeInformationProvider;
    final uri = provider.value.uri;
    prevPop = uri.path;
    router.pop();
    // appBar.setTitle(appBar.prevTitle);
    notifyListeners();
  }

  // For updating the app bar if from pop scope
  void popUpdateAppBar(BuildContext context) {
    GoRouter router = GoRouter.of(context);
    final provider = router.routeInformationProvider;
    final uri = provider.value.uri;
    print(uri);
    final appBar = context.read<AppBarController>();
    prevPop = uri.path;
    appBar.setTitle(appBar.prevTitle);
    notifyListeners();
  }

  void callOnPopScopeListeners(BuildContext context) {
    GoRouter router = GoRouter.of(context);
    final provider = router.routeInformationProvider;
    final uri = provider.value.uri;
    print(uri.pathSegments);
    for (var function in onPopScopeListeners) {
      function(uri.pathSegments);
    }
  }

  void addOnPopScopeListener(
      void Function(List<String> uriPathSegments) listener) {
    if (onPopScopeListeners.contains(listener)) {
      return;
    }
    onPopScopeListeners.add(listener);
  }

  void removeOnPopScopeListener(void Function() listener) {
    onPopScopeListeners.remove(listener);
  }

  void callOnGoListeners(String location) {
    for (var function in onGoListeners) {
      function(location.split('/'));
    }
  }

  void addOnGoListener(void Function(List<String> uriPathSegments) listener) {
    if (onGoListeners.contains(listener)) {
      return;
    }
    onGoListeners.add(listener);
  }

  void removeOnGoListener(void Function() listener) {
    onGoListeners.remove(listener);
  }
}
