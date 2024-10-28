import 'package:flutter/material.dart';
import 'package:room_monitoring_frontend/app.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const App());
}
