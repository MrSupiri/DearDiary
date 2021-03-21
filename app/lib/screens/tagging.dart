import 'dart:convert';
import '../models/taskblock.dart';
import 'package:flutter/material.dart';
import 'package:dear_diary/models/timeblock.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

Future<List<TaskBox>> getTasks(String path) async {
  String url = '192.168.1.39:5000';
  print(Uri.http(url, path));
  List<TaskBox> taskBoxes = [];
  try {
    var response = await http.get(Uri.http(url, path));
    if (response.statusCode == 200) {
      var tagsJson = jsonDecode(response.body)['data'];
      if (tagsJson == null) {
        return taskBoxes;
      }
      List<String> tags = List.from(tagsJson);
      tags.forEach((e) {
        taskBoxes.add(TaskBox(
          title: e,
          path: '$path/$e',
        ));
      });
    }
  } catch (e) {
    // TODO: handle this error with a bit of dignity
    print(e);
  }
  return taskBoxes;
}

class TaggingPage extends StatefulWidget {
  TaggingPage({Key? key}) : super(key: key);

  @override
  _TaggingPageState createState() => _TaggingPageState();
}

class _TaggingPageState extends State<TaggingPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _taggedTimes = [];

    context.watch<TimeBlockModel>().selectedTimeBlocks.forEach((time) {
      _taggedTimes.add(TextButton(
        child: Text(time, textAlign: TextAlign.center),
        onPressed: () {
          context.read<TimeBlockModel>().unSelectTime(time);
        },
      ));
    });

    if (_taggedTimes.length == 0) {
      // Flutter doesn't like when I exit while building 🤷🏽‍♂️
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          // shrinkWrap: true,
          children: [
            Card(
              margin: const EdgeInsets.only(top: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 10.0,
                  children: _taggedTimes,
                ),
              ),
            ),
            FutureTaskBox(path: "")
          ],
        ),
      ),
    );
  }
}

class FutureTaskBox extends StatelessWidget {
  FutureTaskBox({
    required this.path,
  });
  final String path;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: getTasks(path),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Widget>? tasks;
          if (path.split("/").length > 5) {
            tasks = snapshot.data!
                .map((e) => SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        child: e,
                        width: MediaQuery.of(context).size.width - 10,
                      ),
                    ))
                .toList();
          } else {
            tasks = snapshot.data;
          }
          return Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Column(children: tasks!),
          );
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}

class TaskBox extends StatefulWidget {
  TaskBox({required this.title, required this.path});
  final String title;
  final String path;

  @override
  _TaskBoxState createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  bool checked = false;
  @override
  void initState() {
    super.initState();
    checked = context.read<TaskBlockModel>().checkSelected(widget.path);
  }

  @override
  Widget build(BuildContext context) {
    if (checked) {
      return Column(
        children: [
          CheckboxListTile(
            title: new Text(
              widget.title,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
            value: checked,
            onChanged: (bool? value) {
              if (value!) {
                context.read<TaskBlockModel>().unSelectTask(widget.path);
              } else {
                context.read<TaskBlockModel>().selectTask(widget.path);
              }
              setState(() {
                checked = !checked;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          FutureTaskBox(path: widget.path)
        ],
      );
    } else {
      return Column(
        children: [
          CheckboxListTile(
            title: new Text(
              widget.title,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
            ),
            value: checked,
            onChanged: (bool? value) {
              if (value!) {
                context.read<TaskBlockModel>().unSelectTask(widget.path);
              } else {
                context.read<TaskBlockModel>().selectTask(widget.path);
              }
              setState(() {
                checked = !checked;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          )
        ],
      );
    }
  }
}
