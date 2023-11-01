import 'package:alura_flutter/data/task_inherited.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    final taskInherited = TaskInherited.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: ListView(
          children: taskInherited.tasks,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FormScreen(inheritedContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
