import './screens/tagging.dart';
import './screens/time.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => TimeViewPage(),
    '/tagging': (context) => TaggingPage(),
  };
}
