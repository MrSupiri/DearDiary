import 'package:flutter/material.dart';
import 'pages/landing.page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => LandingPage(),
    // '/tagging': (context) => TaggingPage(),
  };
}
