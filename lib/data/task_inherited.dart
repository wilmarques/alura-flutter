import 'package:flutter/material.dart';

import '../task.dart';

class TaskInherited extends InheritedWidget {
  final List<Task> tasks = [
    const Task('Facil', 'images/placeholder-200.png', 0),
  ];

  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.tasks.length != tasks.length;
  }

  void addTask(Task task) {
    tasks.add(task);
  }
}
