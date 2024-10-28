import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_monitoring_frontend/shared/themes/themes.dart';
import 'package:room_monitoring_frontend/shared/types/types.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../controllers/controllers.dart';

class RoomListTile extends StatelessWidget {
  final RoomData data;
  final bool isSkeleton;
  const RoomListTile(this.data, {super.key, this.isSkeleton = false});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isSkeleton,
      child: LayoutBuilder(builder: (context, constraints) {
        return SizedBox(
          child: UnconstrainedBox(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: pagePadding),
              width: constraints.maxWidth >= containerMaxWidth
                  ? containerMaxWidth
                  : constraints.maxWidth,
              child: Card(
                elevation: cardElevation,
                child: ListTile(
                  title: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      data.name,
                      style: Theme.of(context).textTheme.labelLarge,
                      maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  trailing: RichText(
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: '${data.aqi.toString()}  ',
                            style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(
                          text: 'AQI',
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    final nav = context.read<NavigationController>();
                    nav.go(context, '/room/${data.id}');
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
