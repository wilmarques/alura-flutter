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
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: ListView(
        children: [
          Task('Facil', 'src', 0),
          Task('Apredendo Flutter', 'src', 3),
          Task(
              'askdjalskdj alsdjalsdkj alsdj lasjdl ajsdlkja ldskajslkd jklasdjk',
              'src',
              1),
          Task('Andar de Bike', 'src', 2),
          Task('Meditar', 'src', 4),
          Task('Comer', 'src', 5),
        ],
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String photo;
  final int difficulty;

  const Task(this.name, this.photo, this.difficulty, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.blue,
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.black26,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child:
                                Image.network(widget.photo, fit: BoxFit.cover)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: widget.difficulty >= 1
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.difficulty >= 2
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.difficulty >= 3
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.difficulty >= 4
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 15,
                              ),
                              Icon(
                                Icons.star,
                                color: widget.difficulty >= 5
                                    ? Colors.blue
                                    : Colors.blue[100],
                                size: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(Icons.arrow_drop_up),
                              const Text(
                                'Up',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                            color: Colors.white,
                            value: widget.difficulty > 0
                                ? (level / widget.difficulty) / 10
                                : 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        'Nivel: $level',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
