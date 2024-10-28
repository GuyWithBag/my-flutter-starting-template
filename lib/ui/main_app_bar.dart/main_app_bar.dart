import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_monitoring_frontend/controllers/app_bar_controller.dart';
import 'package:room_monitoring_frontend/widgets/widgets.dart';

import '../../shared/themes/colors.dart';

Widget buildAppBar(BuildContext context, {bool forceElevated = false}) {
  AppBarController notifier = context.watch<AppBarController>();

  return SliverAppBar(
    forceElevated: forceElevated,
    expandedHeight: 80,
    pinned: notifier.state.pinned,
    backgroundColor: primaryGreen[500],
    flexibleSpace: FlexibleSpaceBar(
      title: Row(
        children: [
          const BackIconButton(),
          const SizedBox(
            width: 10,
          ),
          SelectableText(
            notifier.state.title ?? '',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    ),
  );
}
