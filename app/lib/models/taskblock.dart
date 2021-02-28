import 'dart:collection';
import 'package:flutter/foundation.dart';

class TaskBlockModel extends ChangeNotifier {
  final List<String> _selectedTaskBlocks = [];
  Map<String, bool> _taskBlocks = {};

  UnmodifiableListView<String> get selectedTaskBlocks =>
      UnmodifiableListView(_selectedTaskBlocks);

  UnmodifiableMapView<String, bool> get taskBlocks =>
      UnmodifiableMapView(_taskBlocks);

  void selectTask(String task) {
    _taskBlocks[task] = true;
    _selectedTaskBlocks.add(task);
    notifyListeners();
  }

  bool checkSelected(String task) {
    if (_taskBlocks.containsKey(task)) {
      return _taskBlocks[task];
    }
    return false;
  }

  void unSelectTask(String task) {
    _taskBlocks[task] = false;

    // .remove will return true only if the task was remove
    if (_selectedTaskBlocks.remove(task)) {
      notifyListeners();
    }
  }

  List<String> getSelectedTasks() {
    List<String> selectedTasks = [];
    _taskBlocks.forEach((String k, bool v) => {
          if (v) {selectedTasks.add(k)}
        });
    return selectedTasks;
  }
}
