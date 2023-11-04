import 'package:flutter/material.dart';
import 'package:learn_flutter_1_udemy_tasks/Navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.amber,
      )),
      home: const Navigation(),
      );
  }
}
