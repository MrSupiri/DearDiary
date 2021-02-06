import 'package:flutter/material.dart';
import 'package:dear_diary/models/timeblock.dart';
import 'package:provider/provider.dart';

class TaggingPage extends StatefulWidget {
  TaggingPage({Key key}) : super(key: key);

  @override
  _TaggingPageState createState() => _TaggingPageState();
}

class _TaggingPageState extends State<TaggingPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _taggedTimes = [];

    context.watch<TimeBlockModel>().selectedTimeBlocks.forEach((time) {
      _taggedTimes.add(FlatButton(
        child: Text(time, textAlign: TextAlign.center),
        onPressed: () {
          context.read<TimeBlockModel>().unSelectTime(time);
        },
      ));
    });

    if (_taggedTimes.length == 0) {
      // Flutter doesn't like when I exit while building 🤷🏽‍♂️
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
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
          ],
        ),
      ),
    );
  }
}
