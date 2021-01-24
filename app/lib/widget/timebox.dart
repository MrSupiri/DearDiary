import 'package:flutter/material.dart';
import '../singletons/tagged_times.dart';

/// This is the stateful widget that the main application instantiates.
class TimeBox extends StatefulWidget {
  // TimeBox({Key key}) : super(key: key);
  TimeBox({this.title});
  final String title;

  @override
  _TimeBoxState createState() => _TimeBoxState();
}

class _TimeBoxState extends State<TimeBox> {
  @override
  Widget build(BuildContext context) {
    bool _selected = taggedTimes.checkTag(widget.title);
    return CheckboxListTile(
      title: new Text(widget.title),
      value: _selected,
      onChanged: (bool value) {
        setState(() {
          _selected = taggedTimes.toggleTime(widget.title);
        });
        // print(_selected);
      },
      controlAffinity: ListTileControlAffinity.platform,
    );
  }
}
