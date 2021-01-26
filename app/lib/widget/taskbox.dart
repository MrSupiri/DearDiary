import 'package:flutter/material.dart';
import '../singletons/tagged_tasks.dart';

/// This is the stateful widget that the main application instantiates.
class TaskBox extends StatefulWidget {
  // TaskBox({Key key}) : super(key: key);
  TaskBox({this.title});
  final String title;

  @override
  _TaskBoxState createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  @override
  Widget build(BuildContext context) {
    bool _selected = taggedTasks.checkTag(widget.title);
    return CheckboxListTile(
      title: new Text(widget.title),
      value: _selected,
      onChanged: (bool value) {
        setState(() {
          _selected = taggedTasks.toggletask(widget.title);
        });
      },
      controlAffinity: ListTileControlAffinity.platform,
    );
  }
}
