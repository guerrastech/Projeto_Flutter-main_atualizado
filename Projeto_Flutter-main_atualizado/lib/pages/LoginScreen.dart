import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_create_vscode/funcoes/validacao_mixins.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_create_vscode/pages/RegisterScreen.dart';
import 'package:flutter_create_vscode/pages/HomeScreen.dart';
import 'package:flutter_create_vscode/pages/PasswordRecoveryScreen.dart';
import 'package:flutter_create_vscode/funcoes/logar.dart';



class LoginScreen extends StatelessWidget with ValidationsMixin {
  LoginScreen({super.key, Key? keys});

  final dio = Dio();
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _verSenha = false;
  

  void getResquest(User) async{ 
    String user = User;
    var response = await dio.get("https://apiloomi.onrender.com/filme/user/"+user+"/");
    print(response.data);
  }


  void postResquest(User) async {
    String user = User;
    var response = await dio.post("https://apiloomi.onrender.com/filme/user/"+user,
    data: {
           "titulo": "string",
            "descricao": "string",
            "link_imagem": "string",
            "data_de_lancamento": "2023-11-16",
            "diretores": "string",
            "roteiristas": "string",
            "atores": "string",
            "generos": "string",
            "comentarios": "string",
            "estrelas": 4,
            "favorito": true,
            "status": "string"
    });
    print(response.data);
  }

  void putResquest() async {
    var response = await dio.put('https://apiloomi.onrender.com/filme/cf50d799-516b-46df-a713-e2ddbfc2e2e0/user/4937ce44-a0b2-43a0-87df-1c6df2552854/',
    data: {
           "titulo": "strasdsadasding",
            "descricao": "gfhghfhfghfg",
            "link_imagem": "string",
            "data_de_lancamento": "2023-11-16",
            "diretores": "string",
            "roteiristas": "string",
            "atores": "string",
            "generos": "string",
            "comentarios": "string",
            "estrelas": 4,
            "favorito": true,
            "status": "string"
    });
    print(response.data);
  }


   void deleteResquest(User) async{ 
    String user = User;
    var response = await dio.delete("https://apiloomi.onrender.com/filme/cf50d799-516b-46df-a713-e2ddbfc2e2e0/user/4937ce44-a0b2-43a0-87df-1c6df2552854/");
    print(response.data);
  }










  @override
  Widget build(BuildContext context) {
    void navigateToRegisterScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    }

    void navigateToPasswordRecoveryScreen() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const PasswordRecoveryScreen(),
        ),
      );
    }

    void navigateToHomeScreen(BuildContext context) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }

    // void navigateToListScreen(BuildContext context) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) =>  ListScreen(),
    //     ),
    //   );
    // }

    // void navigateToAddMovieScreen(BuildContext context) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomeScreen(),
    //     ),
    //   );
    // }

    return Scaffold(
        body: SingleChildScrollView(
      reverse: true,
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Imagem do app
            Container(
              margin: const EdgeInsets.only(
                top: 60,
              ),
              width: 150,
              height: 150,
              child: Image.asset('assets/images/img_claquete.png'),
            ),

            //Nome do app
            Container(
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                'ClackMovie',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            //Texto de Login
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Login',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            //Texto de Email ou Nome de Usuário
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email ou Nome de Usuário',
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

            //Texto de Senha
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextFormField(
                      obscureText: !_verSenha,
                      controller: _senhaController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(_verSenha? Icons.visibility_outlined: Icons.visibility_off_outlined),
                          onPressed:() {
                      
                          },),
                        labelText: 'Senha',
                        labelStyle: GoogleFonts.poppins(),
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: Color(0xFF9F86C0),
                        ),
                      ),
                      validator: validarSenha,
                    ),
                  ],
                ),
              ),
            ),

            //Texto de Esqueceu a senha?
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: navigateToPasswordRecoveryScreen,
                child: Text('Esqueceu a senha?',
                    style: GoogleFonts.poppins().copyWith(
                      fontSize: 14.5,
                      color: Color(0xFF646464),
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),

            //Botão e o texto dentro(Entrar)
            Container(
              margin: const EdgeInsets.only(
                top: 50,
              ),
              child: ElevatedButton(
                onPressed: () {
                  
                  if (_formkey.currentState!.validate()) {
                     logar(context,_emailController.text,_senhaController.text);
                     //apiconfig.getFilme();
                     //getResquest(null);
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
                  'Entrar',
                  style: GoogleFonts.poppins().copyWith(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            //Texto de Ainda não tem cadastro? Registre-se
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: navigateToRegisterScreen,
                child: Text('Ainda não tem cadastro? Registre-se',
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
    ));


  }

  void limpar(){
    _emailController.clear();
    _senhaController.clear();
  }


}
