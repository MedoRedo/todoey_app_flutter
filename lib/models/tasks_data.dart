import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import 'task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount => _tasks.length;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Future<void> getData() async {
    final box = await Hive.openBox<Task>('tasks');
    _tasks = box.values.toList();
    notifyListeners();
  }

  void addNewTask(String title) async {
    var box = await Hive.openBox<Task>('tasks');
    box.add(Task(name: title));

    notifyListeners();
  }

  void toggleTask(int index) async {
    var box = await Hive.openBox<Task>('tasks');
    Task task = _tasks[index];
    task.toggleDone();
    box.putAt(index, task);
    notifyListeners();
  }

  Future<void> deleteTask(int index) async {
    final box = await Hive.openBox<Task>('tasks');
    box.deleteAt(index);
    notifyListeners();
  }
}
