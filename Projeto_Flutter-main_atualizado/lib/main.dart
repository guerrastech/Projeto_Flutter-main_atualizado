import 'package:flutter/material.dart';
import 'package:flutter_create_vscode/pages/HomeScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Corrigindo a declaração do construtor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClackMovie',
      home: HomeScreen(),
    );
  }
}

