import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Tela Favoritos

class FavoriteMovies {
  final String title;
  final String genre;
  final String director;
  final String cast;
  final String plot;
  final String rate;
  final String imgPath;

  FavoriteMovies(this.title, this.genre, this.director, this.cast, this.plot,
      this.rate, this.imgPath);
}

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<FavoriteMovies> movies = [
      FavoriteMovies(
        'Halloween - O início',
        'Terror',
        'Rob Zombie',
        'Malcolm McDowell, Brad Dourif, ...',
        'Michael Myers, traumatizado desde a infância, foge de uma clínica psiquiátrica após 15 anos. Usando uma máscara, retorna a Haddonfield na véspera do Dia das Bruxas para se vingar. Seu passado inclui assassinatos e uma infância perturbadora, marcada por maus-tratos a animais e o assassinato de sua família no Dia das Bruxas. Agora, em silêncio, ele busca vingança na cidade onde tudo começou.',
        '4.5/5',
        'https://tse2.mm.bing.net/th?id=OIP.9Jpo7iU5VcteZvrOiiwhcQHaEK&pid=Api&P=0&h=180',
      ),
    ];

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
                'Favoritos',
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
                          movie: movies[index],
                        ),
                      ),
                    );
                  },
                  child: MovieCard(movies[index]),
                );
              },
              childCount: movies.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget MovieCard(FavoriteMovies movie) {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        leading: Image.network(
          movie.imgPath,
          width: 100.0,
          height: 72.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          movie.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'Avaliação: ${movie.rate}',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}

class FavoriteMovieDetailsScreen extends StatelessWidget {
  final FavoriteMovies movie;

  FavoriteMovieDetailsScreen({required this.movie});

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
            title: Text(movie.title),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    movie.imgPath,
                    width: 380.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                  ),
                  Text(
                    movie.title,
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
                        '${movie.genre}',
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
                        '${movie.director}',
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
                        '${movie.cast}',
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
                          '${movie.plot}',
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
                        '${movie.rate}',
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