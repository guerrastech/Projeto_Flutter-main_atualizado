import 'package:flutter/material.dart';
import 'package:flutter_create_vscode/pages/LoginScreen.dart';
import 'package:flutter_create_vscode/pages/RegisterScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Corrigindo a declaração do construtor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClackMovie',
      home: LoginScreen(),
    );
  }
}

