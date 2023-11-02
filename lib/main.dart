import 'package:flutter/material.dart';

import 'components/task.dart';
import 'data/task_inherited.dart';
import 'screens/home_page.dart';

final List<Task> tasks = [
  Task('Facil', 'assets/images/placeholder-200.png', 0),
  Task('Dificil', 'assets/images/placeholder-200.png', 5),
  Task('Muito Dificil', 'assets/images/placeholder-200.png', 5),
  Task('Muito Dificil', 'assets/images/placeholder-200.png', 5),
  Task('Muito Dificil', 'assets/images/placeholder-200.png', 5),
  Task('Muito Dificil', 'assets/images/placeholder-200.png', 5),
  Task('Muito Dificil', 'assets/images/placeholder-200.png', 5),
  Task('Muito Dificil', 'assets/images/placeholder-200.png', 5),
  Task('Internet', 'https://placehold.co/200.png', 5),
];

void main() {
  runApp(const AluraFlutterApp());
}

class AluraFlutterApp extends StatelessWidget {
  const AluraFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alura Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskInherited(tasks: tasks, child: const HomePage()),
    );
  }
}
