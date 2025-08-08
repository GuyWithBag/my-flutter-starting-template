import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:template/controllers/controllers.dart';
import 'package:template/shared/themes/colors.dart';
import 'package:template/shared/themes/themes.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.watch<AppBarController>();
    return Visibility(
      visible: GoRouter.of(context).canPop(),
      child: IconButton(
        onPressed: () {
          final nav = context.read<NavigationController>();
          nav.pop(context);
        },
        style: ButtonStyle(backgroundColor: iconButtonBackground),
        icon: const Icon(Icons.arrow_back),
        //replace with our own icon data.
      ),
    );
  }
}
