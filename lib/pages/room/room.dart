import 'package:flutter/material.dart';
import 'package:room_monitoring_frontend/widgets/app_page/app_page.dart';

// '/room/:id/'

class Room extends StatelessWidget {
  final String? id;

  const Room({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      appBarTitle: 'Room ${id ?? ''}',
      child: Text(id ?? ''),
    );
  }
}
