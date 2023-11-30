import 'dart:convert';


class FilmeModel{
  final String uuid;
  final String titulo;
  final String descricao;
  final String link_imagem;
  final String data_de_lancamento;
  final String diretores;
  final String roteiristas;
  final String atores;
  final String generos;
  final String comentarios;
  final double estrelas;
  final bool favorito;
  final String status;

  FilmeModel({
    required this.uuid, 
    required this.titulo, 
    required this.descricao, 
    required this.link_imagem, 
    required this.data_de_lancamento, 
    required this.diretores, 
    required this.roteiristas, 
    required this.atores, 
    required this.generos, 
    required this.comentarios, 
    required this.estrelas, 
    required this.favorito, 
    required this.status
    }
  );


  factory FilmeModel.fromMap(Map<String, dynamic> json)=>FilmeModel(
        uuid: json['uuid'], 
        titulo: json['titulo'], 
        descricao: json['descricao'], 
        link_imagem: json['imagen'], 
        data_de_lancamento: json['lancamento'], 
        diretores: json['diretores'], 
        roteiristas: json['roteiristas'], 
        atores: json['atores'], 
        generos: json['generos'], 
        comentarios: json['comentarios'], 
        estrelas: json['estrelas'], 
        favorito: json['favorito'], 
        status: json['status']);
  

  factory  FilmeModel.FromJson(String str) =>
    FilmeModel.fromMap(json.decode(str));   
}