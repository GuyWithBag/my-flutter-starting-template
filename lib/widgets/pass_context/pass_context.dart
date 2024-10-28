import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class _ContextNotifer extends ChangeNotifier {
  BuildContext? passedContext;

  void setContext(BuildContext context) {
    passedContext = context;
    notifyListeners();
  }
}

class PassContext extends HookWidget {
  final BuildContext passedContext;
  final Widget child;
  const PassContext(
      {super.key, required this.passedContext, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _ContextNotifer(),
        builder: (context, _) {
          // final _ContextNotifer provider = context.watch<_ContextNotifer>();
          return child;
        });
  }
}
