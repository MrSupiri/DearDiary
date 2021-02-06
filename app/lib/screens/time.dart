import 'package:flutter/material.dart';
import 'package:dear_diary/models/timeblock.dart';
import 'package:provider/provider.dart';

class TimeViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Widget> timeBlocks = [];

    context.watch<TimeBlockModel>().timeBlocks.forEach((time, state) {
      timeBlocks.add(TimeBox(
        title: time,
        checked: state,
      ));
    });

    return Scaffold(
      appBar: AppBar(title: const Text("Dear Diray")),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: timeBlocks,
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

class TimeBox extends StatelessWidget {
  // const TimeBox({Key key}) : super(key: key);
  TimeBox({this.title, this.checked});
  final String title;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: new Text(title),
      value: checked,
      onChanged: (bool value) {
        if (checked) {
          context.read<TimeBlockModel>().unSelectTime(title);
        } else {
          context.read<TimeBlockModel>().selectedTime(title);
        }
      },
      controlAffinity: ListTileControlAffinity.platform,
    );
  }
}
