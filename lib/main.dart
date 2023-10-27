import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const AluraFlutterApp());
}

class AluraFlutterApp extends StatelessWidget {
  const AluraFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
