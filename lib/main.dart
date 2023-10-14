import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: Column(
        children: [
          Task('Apredendo Flutter'),
          Task('Andar de Bike'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
          Task('Meditar'),
        ],
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String taskName;
  const Task(this.taskName, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Container(
            color: Colors.white,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                ),
                Text(taskName),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.arrow_drop_up),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
