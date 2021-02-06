import 'package:dear_diary/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dear_diary/models/timeblock.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TimeBlockModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getRoutes(),
    );
  }
}
