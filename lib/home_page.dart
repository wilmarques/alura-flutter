import 'package:flutter/material.dart';

import 'task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: ListView(
          children: const [
            Task('Facil', 'images/placeholder-200.png', 0),
            Task('Apredendo Flutter', 'images/placeholder-200.png', 3),
            Task(
                'askdjalskdj alsdjalsdkj alsdj lasjdl ajsdlkja ldskajslkd jklasdjk',
                'images/placeholder-200.png',
                1),
            Task('Andar de Bike', 'images/placeholder-200.png', 2),
            Task('Meditar', 'images/placeholder-200.png', 4),
            Task('Comer', 'images/placeholder-200.png', 5),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacity = !opacity;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
