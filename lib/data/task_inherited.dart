import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  final List<Task> tasks;

  const TaskInherited({
    Key? key,
    required this.tasks,
    required Widget child,
  }) : super(key: key, child: child);

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.tasks != tasks;
  }

  void addTask(Task task) {
    tasks.add(task);
  }
}
