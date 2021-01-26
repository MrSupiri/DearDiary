import 'package:flutter/material.dart';
import '../widget/timebox.dart';
import 'package:intl/intl.dart';

/// This is the stateful widget that the main application instantiates.
class TimeViewPage extends StatelessWidget {
  // TimeViewPage({Key key}) : super(key: key);
  final List<Widget> timeList = [];

  TimeViewPage({Key key}) {
    final now = DateTime.now();
    var lastMidnight = new DateTime(now.year, now.month, now.day);
    for (var i = 0; i <= (60 * 24) - 1; i += 15) {
      String formattedTime =
          DateFormat.Hms().format(lastMidnight.add(Duration(minutes: i)));
      timeList.add(TimeBox(title: formattedTime));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dear Diray")),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: timeList,
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/tagging',
          );
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
