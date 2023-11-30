import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_create_vscode/funcoes/validacao_mixins.dart';
import 'package:flutter_create_vscode/pages/LoginScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

//Tela de cadastro

class RegisterScreen extends StatelessWidget with ValidationsMixin {
  RegisterScreen({super.key, Key? keys});
  
  final dio = Dio();
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _nomeController = TextEditingController();
  final _telefoneController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 30,
                  right: 320,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop(); // Voltar para a tela anterior
                  },
                  color: const Color(0xFF5E548E),
                  iconSize: 30,
                ),
              ),

              // Texto "Cadastre-se"
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                child: Text(
                  'Cadastre-se',
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Texto Nome de Usuário
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nomeController,
                        decoration: InputDecoration(
                          labelText: 'Nome de Usuário',
                          labelStyle: GoogleFonts.poppins(),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Color(0xFF9F86C0),
                          ),
                        ),
                        validator: validarNome,
                      ),
                    ],
                  ),
                ),
              ),

              //Texto Número de telefone
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _telefoneController,
                        decoration: InputDecoration(
                          labelText: 'Número de Telefone',
                          labelStyle: GoogleFonts.poppins(),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF9F86C0),
                          ),
                        ),
                        validator: validarTelefone,
                      ),
                    ],
                  ),
                ),
              ),

              //Texto Email
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: GoogleFonts.poppins(),
                          prefixIcon: Icon(
                            Icons.alternate_email_rounded,
                            color: Color(0xFF9F86C0),
                          ),
                        ),
                        validator: validarEmail,
                      ),
                    ],
                  ),
                ),
              ),

              //Texto Senha
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      TextFormField(
                        obscureText: true,
                      controller: _senhaController,
                      keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                          icon: Icon(Icons.visibility_off_outlined),
                          onPressed:() {
                      
                          },),
                          labelText: 'Senha',
                          labelStyle: GoogleFonts
                              .poppins(), // Aplicando a fonte Poppins
                          prefixIcon: Icon(
                            Icons.lock_rounded,
                            color: Color(0xFF9F86C0),
                          ),
                        ),validator: validarSenha,
                      ),
                    ],
                  ),
                ),
              ),

              

              //Botão Cadastrar
              Container(
                margin: const EdgeInsets.only(
                  top: 50,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()){
                      var url = Uri.parse('https://apiloomi.onrender.com/login/');
                      var response = http.post(url,
                        body: {      
                          'username': _emailController.text,
                          'password': _senhaController.text
                          },
                        );
                        print(response);
                        
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E548E),
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Cadastrar',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              //Texto Já possui uma conta? Entre
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(); // Retorna à tela anterior
                  },
                  child: Text('Já possui uma conta? Entre',
                      style: GoogleFonts.poppins().copyWith(
                        fontSize: 14.5,
                        color: Color(0xFF646464),
                        fontWeight: FontWeight.w500,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}