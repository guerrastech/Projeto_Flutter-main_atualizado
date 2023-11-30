import 'dart:convert';

import 'package:flutter_create_vscode/models/filme_modelo.dart';
import 'package:http/http.dart' as http;

Future<List<FilmeModel>> listarFilmes(String user) async {
  var url = Uri.parse('https://apiloomi.onrender.com/filme/user/$user/');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    List<dynamic> decodeData = json.decode(response.body);
    List<FilmeModel> tempFilmes = [];

    for (var data in decodeData) {
      tempFilmes.add(
        FilmeModel(
        uuid: data['uuid'],
        titulo: data['titulo'],
        descricao: data['descricao'],
        link_imagem: data['link_imagem'],
        data_de_lancamento: data['data_de_lancamento'],
        diretores: data['diretores'],
        roteiristas: data['roteiristas'],
        atores: data['atores'],
        generos: data['generos'],
        comentarios: data['comentarios'],
        estrelas: data['estrelas'],
        favorito: data['favorito'],
        status: data['status'],
      ));
    }

    return tempFilmes;
  } else {
    // Em caso de falha na requisição, pode-se retornar uma lista vazia ou null, dependendo do caso.
    return [];
  }
}



  