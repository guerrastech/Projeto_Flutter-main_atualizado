 import 'package:shared_preferences/shared_preferences.dart';
 
  //Função responável por fazer o logout dos usuários cadastrados (Desenvolvido pelo maravilhoso e majestoso programador Gabriel Guerra)

Future<bool> Logout() async{
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();
  return true;
 }