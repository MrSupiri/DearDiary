import 'package:dear_diary/screens/time.dart';
import 'package:dear_diary/screens/tagging.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => TimeViewPage(),
    '/tagging': (context) => TaggingPage(),
  };
}
