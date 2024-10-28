import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:room_monitoring_frontend/controllers/controllers.dart';
import 'package:room_monitoring_frontend/shared/themes/colors.dart';

class AppPage extends HookWidget {
  final Widget? child;
  final String? appBarTitle;
  final bool isChildSliver;

  const AppPage(
      {super.key, this.child, this.appBarTitle, this.isChildSliver = false});

  @override
  Widget build(BuildContext context) {
    // if (!isChildSliver) {
    // return SliverToBoxAdapter(
    // child: child,
    // );
    // }
    final nav = context.read<NavigationController>();
    final appBar = context.read<AppBarController>();
    // }
    // print('\n----------------------------');
    // print('AppBarTitle:$appBarTitle');
    // print('prevRoute: ${nav.prevRoute}');
    // print('prevPop: ${nav.prevPop}');
    // print('prevTitle: ${appBar.prevTitle}');
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        appBar.setTitle(appBarTitle);
      });
      return null;
    }, []);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        nav.popUpdateAppBar(context);
        nav.callOnPopScopeListeners(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: primaryGreen[500],
        ),
        child: child ?? const SizedBox(),
      ),
    );
  }
}
