import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart';

import '../shared/types/types.dart';

Future<List<User>> useRooms() async {
  final Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
  final Response res = await get(uri);
  if (res.statusCode != 200) {
    return [];
  }
  List body = json.decode(res.body);
  List<User> output = body
      .map((e) => User(
          userId: e['userId'],
          id: e['id'],
          title: e['title'],
          completed: e['completed']))
      .toList();
  return output;
}

// Future<ValueNotifier> useRooms() async {
//   final result = useState<List>(await _getRooms());
//   return result;
// }

// Result useMyHook() {
//   return use(const _TimeAlive());
// }

// class _TimeAlive extends Hook<void> {
//   const _TimeAlive();

//   @override
//   _TimeAliveState createState() => _TimeAliveState();
// }

// class _TimeAliveState extends HookState<void, _TimeAlive> {
//   DateTime start;

//   @override
//   void initHook() {
//     super.initHook();
//     start = DateTime.now();
//   }

//   @override
//   void build(BuildContext context) {}

//   @override
//   void dispose() {
//     print(DateTime.now().difference(start));
//     super.dispose();
//   }
// }
