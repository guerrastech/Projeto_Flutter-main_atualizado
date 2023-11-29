mixin ValidationsMixin {
  String? validarEmail(String? email, [String? message]) {
    if (email!.isEmpty){ return message ?? 'Este campo é obrigatório';}
    //else if (!RegExp(
     //                   r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
       //                 .hasMatch(email)) {
         //             return 'Por favor, digite um e-mail correto';
           //           }

    return null;
  }

  String? validarSenha(String? senha, [String? message]) {
    if (senha!.isEmpty) {return message ?? 'Este campo é obrigatório';}
    else if(senha.length < 6){
      return 'Por favor digite uma senha com mais de 6 dígitos';
    }
    return null;
  }

}
