import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_create_vscode/pages/AddMovieScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_create_vscode/pages/ProfileScreen.dart';
import 'package:flutter_create_vscode/pages/ListScreen.dart';
import 'package:flutter_create_vscode/models/filme_modelo.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio();
  List<FilmeModel> filmes = [];

  @override
  void initState() {
    super.initState();
    getResquest();
  }

  void getResquest() async {
    var url = Uri.parse('https://apiloomi.onrender.com/filme/user/4937ce44-a0b2-43a0-87df-1c6df2552854/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> decodeData = json.decode(response.body);
      print(decodeData[1]);
      List<FilmeModel> tempFilmes = [];

      for (var data in decodeData) {
        tempFilmes.add(FilmeModel(
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
        status: data['status']
      ));
      }

      setState(() {
        filmes = tempFilmes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 2;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 40.0, 8.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            SizedBox(width: 8),
                            Icon(
                              Icons.search,
                              color: Color(0xFF7D7D7D),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Digite o nome do filme',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    IconButton(
                      icon: Icon(
                        Icons.filter_alt_rounded,
                        color: Color(0xFF9F86C0),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                'MEUS FILMES',
                style: GoogleFonts.poppins().copyWith(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 1.0,
              mainAxisSpacing: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return movieCard(filmes[index]);
              },
              childCount: filmes.length,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Color(0xFF9F86C0), size: 30),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Color(0xFF9F86C0),
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.format_list_bulleted_add,
                  color: Color(0xFF9F86C0), size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListScreen()),
                );
              },
            ),
            // IconButton(
            //      icon: Icon.add_box_outlined,
            //           color: Color(0xFF9F86C0), size: 30),
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => AddMovieScreen())
            //       )
            //     }
          ],
        ),
      ),
    );
  }

  Widget movieCard(FilmeModel tempFilmes) {
    print(tempFilmes.link_imagem);
    return GestureDetector(
  
      onTap: () {
        // Navigate to the movie details screen
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(
            
              tempFilmes.link_imagem,
              width: 100,
              fit: BoxFit.cover,
              height: 120.0,
            ),
            SizedBox(height: 4),
            Text(
              tempFilmes.titulo,
              style: GoogleFonts.poppins().copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}