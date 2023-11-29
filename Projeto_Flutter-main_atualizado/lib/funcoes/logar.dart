import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_create_vscode/pages/LoginScreen.dart';
import 'package:flutter_create_vscode/pages/HomeScreen.dart';

//Função responável por fazer o login dos usuários cadastrados (Desenvolvido pelo maravilhoso e majestoso programador Gabriel Guerra)

logar(BuildContext context, email,senha) async {

  LoginScreen loginTela = LoginScreen();
  SharedPreferences _sharedpreferences = await SharedPreferences.getInstance();
  var url = Uri.parse('https://apiloomi.onrender.com/login/');
  var response = await http.post(url,
    body: {      
      'username': email,
      'password': senha
      },
    );
    if(response.statusCode == 200){
      await _sharedpreferences.setString('user_id', 'Token ${json.decode(response.body)["user_id"]}');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      String token = json.decode(response.body)["user_id"];
      //postResquest(token);
      //deleteResquest(token);
      //TelaHome.getResquest();
      //putResquest();
    }else{
      loginTela.limpar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('Email ou senha inválidos'),
          behavior: SnackBarBehavior.floating,
          )
          
      );
    }
  }