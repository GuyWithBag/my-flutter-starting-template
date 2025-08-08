import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template/controllers/app_bar_controller.dart';
import 'package:template/widgets/widgets.dart';

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
