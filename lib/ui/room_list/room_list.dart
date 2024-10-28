import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:room_monitoring_frontend/features/use_rooms.dart';
import 'package:room_monitoring_frontend/shared/types/types.dart';
import 'package:room_monitoring_frontend/widgets/room_list_tile/room_list_tile.dart';

import '../../controllers/controllers.dart';

// const BoxConstraints(maxWidth: 500)
class RoomList extends HookWidget {
  const RoomList({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarController = context.watch<AppBarController>();
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final controller = appBarController.controller;
        if (controller != null) {
          // print((notification.metrics.pixels / controller.offset));
          // print(controller.offset + notification.metrics.pixels);
          // print(controller.offset + (notification.metrics.pixels * 0.1));
          controller.jumpTo(notification.metrics.pixels * 0.8);
        }
        return false;
      },
      child: CustomScrollView(
        primary: false,
        shrinkWrap: true,
        // controller: scrollController.controller,
        // key: const PageStorageKey<String>('ass'),
        slivers: [
          SliverOverlapInjector(
            // This is the flip side of the SliverOverlapAbsorber
            // above.
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          FutureBuilder(
            future: useRooms(),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const _ListWidget(isSkeleton: true);
              } else if (snapshot.connectionState == ConnectionState.none) {
                // if (snapshot.connectionState == ConnectionState.none) {
                return const SliverFillRemaining(
                    child: Text('none can be found here'));
              }
              final List<User> data = snapshot.data!;
              return _ListWidget(data: data);
            },
          ),
        ],
      ),
    );
  }
}

class _ListWidget extends StatelessWidget {
  final List<User>? data;
  final bool isSkeleton;
  const _ListWidget({
    super.key,
    this.data,
    this.isSkeleton = false,
  });

  // padding: const EdgeInsets.all(8),

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return const SliverFillRemaining(child: Text('no data'));
    }

    return SliverList.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 1,
      ),
      itemCount: data == null ? 5 : data!.length,
      itemBuilder: (context, index) {
        if (isSkeleton) {
          return RoomListTile(
            RoomData(
              id: '0',
              name: 'Lorem Ipsum',
              humidity: 0,
              aqi: 80,
              temperature: 0,
              dustConcentration: 0,
            ),
            isSkeleton: true,
          );
        }
        final value = data![index];
        return RoomListTile(
          RoomData(
            id: value.id.toString(),
            name: value.title,
            humidity: 0,
            aqi: 80,
            temperature: 0,
            dustConcentration: 0,
          ),
        );
      },
    );
//     return SliverFixedExtentList(
//       itemExtent: data == null ? 5 : data!.length,
//       delegate: SliverChildBuilderDelegate(
//         (context, index) {
//           if (data == null) {
//             return const SliverFillRemaining(child: Text('no data'));
//           } else if (isSkeleton) {
//             return RoomListTile(
//               RoomData(
//                 id: '0',
//                 name: 'Lorem Ipsum',
//                 humidity: 0,
//                 aqi: 80,
//                 temperature: 0,
//                 dustConcentration: 0,
//               ),
//               isSkeleton: true,
//             );
//           }
//           final value = data![index];
//           return RoomListTile(
//             RoomData(
//               id: value.id.toString(),
//               name: value.title,
//               humidity: 0,
//               aqi: 80,
//               temperature: 0,
//               dustConcentration: 0,
//             ),
//           );
//         },
//         childCount: data!.length,
//       ),
//     );
  }
}
