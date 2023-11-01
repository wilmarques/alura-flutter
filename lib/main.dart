import 'package:flutter/material.dart';

import 'data/task_inherited.dart';
import 'screens/home_page.dart';

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
      home: TaskInherited(child: HomePage()),
    );
  }
}
