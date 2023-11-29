import 'dart:convert';
import 'filme_modelo.dart';

class FilmeResponseModelo{
  int page;
  final int quantFilmes;
  final int totalPaginas;
  final List<FilmeModel> movies;

  FilmeResponseModelo({
    required this.page,
    required this.totalPaginas,
    required this.quantFilmes,
    required this.movies,
  });


  factory FilmeResponseModelo.FromJson(String str)=>
  FilmeResponseModelo.fromMap(json.decode(str));


  factory FilmeResponseModelo.fromMap(Map<String, dynamic> json)=>
    FilmeResponseModelo(
      page: json["pages"],
      totalPaginas: json["totalPaginas"],
      quantFilmes: json["quantFilmes"],
      movies: List<FilmeModel>.from(
        json["result"].map((x)=> FilmeModel.fromMap(x))
      )
    );

}