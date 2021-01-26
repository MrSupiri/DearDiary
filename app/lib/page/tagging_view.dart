import 'package:flutter/material.dart';
import '../singletons/tagged_times.dart';

class TaggingPage extends StatefulWidget {
  TaggingPage({Key key}) : super(key: key);

  @override
  _TaggingPageState createState() => _TaggingPageState();
}

class _TaggingPageState extends State<TaggingPage> {
  List<String> _taggedTimes = taggedTimes.getTaggedTimes();

  List<Widget> getTaggedTimes() {
    return _taggedTimes
        .map((time) => FlatButton(
              child: Text(time, textAlign: TextAlign.center),
              onPressed: () {
                taggedTimes.unTagTime(time);
                setState(() {
                  _taggedTimes = taggedTimes.getTaggedTimes();
                });
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
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
                  children: getTaggedTimes(),
                ),
              ),
            ),
            FlatButton(
              child: Text('Pop!'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class TaggingPage extends StatelessWidget {
//   const TaggingPage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }
