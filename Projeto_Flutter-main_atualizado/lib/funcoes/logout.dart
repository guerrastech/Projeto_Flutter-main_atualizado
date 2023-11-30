import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_create_vscode/pages/LoginScreen.dart';

 
  //Função responável por fazer o logout dos usuários cadastrados (Desenvolvido pelo maravilhoso e majestoso programador Gabriel Guerra)

Future<void> Logout(BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => LoginScreen()),
  );
}