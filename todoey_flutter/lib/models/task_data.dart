import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoeyflutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  int get taskCount =>  _tasks.length;

  void addTasks (String newTask) {
    _tasks.add(Task(taskName: newTask));
    notifyListeners();
  }

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}