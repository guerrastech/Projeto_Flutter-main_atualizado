import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_create_vscode/funcoes/listarFilmes.dart';
import 'package:flutter_create_vscode/models/filme_modelo.dart';
import 'package:flutter_create_vscode/repositorios/deletarFilme.dart';
import 'package:google_fonts/google_fonts.dart';

//Tela Favoritos



class WatchedMoviesScreen extends StatefulWidget {
  final String token;
  WatchedMoviesScreen({key, required this.token}) : super(key: key);

   @override
  _WatchedMoviesScreenState createState() => _WatchedMoviesScreenState();
  

}


//////////////////////////////////////////////////////////////////////////////


class _WatchedMoviesScreenState extends State<WatchedMoviesScreen> {
  late String User;
  final dio = Dio();
  List<FilmeModel> tempfilmes = [];

  @override
  void initState() {
    super.initState();
    User = widget.token;
    listarFilmes(User).then((tempFilmes) {
      setState(() {
        tempfilmes = tempFilmes;
      });
    });
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: const Color(0xFF5E548E),
              iconSize: 30,
            ),
            title: Container(
              margin: const EdgeInsets.only(left: 60),
              child: Text(
                'Assistidos',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            expandedHeight: 50.0,
          ),
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 8.0, 0.0),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavoriteMovieDetailsScreen(
                          tempFilmes: tempfilmes[index],
                        ),
                      ),
                    );
                  },
                  child: MovieCard(tempfilmes[index]),
                );
              },
              childCount: tempfilmes.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget MovieCard(FilmeModel tempFilmes) {
    print(tempFilmes.titulo);
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        // leading: Image.network(
        //   tempFilmes.link_imagem,
        //   width: 100.0,
        //   height: 72.0,
        //   fit: BoxFit.cover,
        // ),
        title: Text(
          tempFilmes.titulo,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Avaliação: ${tempFilmes.estrelas}',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            deleteResquest(User, tempFilmes.uuid);
          },
        ),
      ),
    );
  }
}


////////////////////////////////////////////////////////////////
class FavoriteMovieDetailsScreen extends StatelessWidget {
  final FilmeModel tempFilmes;

  FavoriteMovieDetailsScreen({required this.tempFilmes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: const Color(0xFF5E548E),
              iconSize: 30,
            ),
            title: Text(tempFilmes.titulo),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    tempFilmes.link_imagem,
                    width: 380.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                  ),
                  Text(
                    tempFilmes.titulo,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        'Gênero: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${tempFilmes.generos}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        'Direção: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${tempFilmes.diretores}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        'Atuação: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${tempFilmes.atores}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      Text(
                        'Enredo: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 9),
                        width: MediaQuery.of(context).size.width - 20,
                        child: Text(
                          '${tempFilmes.descricao}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                      ),
                      Text(
                        'Avaliação: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${tempFilmes.estrelas}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}