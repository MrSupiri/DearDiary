import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class TimeBlockModel extends ChangeNotifier {
  final List<String> _selectedTimeBlocks = [];
  Map<String, bool> _timeBlocks = {};

  TimeBlockModel() {
    final DateTime now = new DateTime.now();
    DateTime lastMidnight = new DateTime(now.year, now.month, now.day);
    for (int i = 0; i <= (60 * 24) - 1; i += 15) {
      String formattedTime =
          DateFormat.Hms().format(lastMidnight.add(Duration(minutes: i)));
      _timeBlocks[formattedTime] = false;
    }
  }

  UnmodifiableListView<String> get selectedTimeBlocks =>
      UnmodifiableListView(_selectedTimeBlocks);

  UnmodifiableMapView<String, bool> get timeBlocks =>
      UnmodifiableMapView(_timeBlocks);

  void selectedTime(String time) {
    _timeBlocks[time] = true;
    _selectedTimeBlocks.add(time);
    _selectedTimeBlocks.sort();
    notifyListeners();
  }

  void unSelectTime(String time) {
    _timeBlocks[time] = false;

    // .remove will return true only if the time was remove
    if (_selectedTimeBlocks.remove(time)) {
      notifyListeners();
    }
  }

  List<String> getSelectedTasks() {
    List<String> selectedTimes = [];
    _timeBlocks.forEach((String k, bool v) => {
          if (v) {selectedTimes.add(k)}
        });
    return selectedTimes;
  }
}
