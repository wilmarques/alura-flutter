import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Center(
          child: Text(
            'Veja o README',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
