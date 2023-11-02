import 'package:flutter/material.dart';

import 'data/bank_inherited.dart';
import 'screens/home.dart';
import 'themes/purple_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: purpleTheme,
      home: BankInherited(child: const Home()),
    );
  }
}
