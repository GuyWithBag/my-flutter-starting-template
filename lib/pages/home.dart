import 'package:flutter/material.dart';
import 'package:room_monitoring_frontend/ui/room_list/room_list.dart';
import 'package:room_monitoring_frontend/widgets/app_page/app_page.dart';

// '/'

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return const AppPage(
      // alignment: Alignment.topCenter,
      // padding: const EdgeInsets.all(20),
      // isChildSliver: false,
      appBarTitle: 'Room List',
      child: RoomList(),
    );
  }
}
