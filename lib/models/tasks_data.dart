import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'buy milk'),
    Task(name: 'buy cheese'),
    Task(name: 'buy sugar'),
  ];

  int get taskCount => tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void addNewTask(String title) {
    _tasks.add(Task(name: title));
    notifyListeners();
  }

  void toggleTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
