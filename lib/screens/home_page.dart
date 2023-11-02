import 'package:alura_flutter/data/task_inherited.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 80),
        children: TaskInherited.of(context).tasks,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FormScreen(context: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
