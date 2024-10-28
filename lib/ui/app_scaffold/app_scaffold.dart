import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:room_monitoring_frontend/controllers/controllers.dart';
import 'package:room_monitoring_frontend/shared/themes/colors.dart';
import 'package:room_monitoring_frontend/ui/ui.dart';
import 'package:room_monitoring_frontend/widgets/widgets.dart';

class AppScaffold extends HookWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final appBarController = context.watch<AppBarController>();
    useEffect(() {
      appBarController.controller = ScrollController();
      // scrollController.controller!.animateTo(offset, duration: duration, curve: curve)
      return appBarController.controller!.dispose;
    });
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        controller: appBarController.controller,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: buildAppBar(
                context,
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: child,
      ),
    );
  }
}
