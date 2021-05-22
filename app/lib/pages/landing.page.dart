import 'package:flutter/material.dart';

import 'package:yui/util/constants.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            minimum: EdgeInsets.all(Layout.kLeftRightPadding),
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${_getGreeting()}",
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Oof! It’s a Monday. What are your 2 main goals for the day?",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )));
  }

  String _getGreeting() {
    var currentTime = DateTime.now();
    if (currentTime.hour >= 0 && currentTime.hour < 12) {
      return K.GOOD_MORNING;
    } else if (currentTime.hour >= 12 && currentTime.hour < 17) {
      return K.GOOD_AFTERNOON;
    } else {
      return K.GOOD_EVENING;
    }
  }
}
