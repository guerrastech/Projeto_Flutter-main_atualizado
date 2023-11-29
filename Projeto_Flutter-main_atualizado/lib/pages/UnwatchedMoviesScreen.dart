import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//Tela Não Assistidos

class UnwatchedMovies {
  final String title;
  final String genre;
  final String director;
  final String cast;
  final String plot;
  final String rate;
  final String imgPath;

  UnwatchedMovies(this.title, this.genre, this.director, this.cast, this.plot,
      this.rate, this.imgPath);
}

class UnwatchedMoviesScreen extends StatelessWidget {
  const UnwatchedMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<UnwatchedMovies> movies = [
      UnwatchedMovies(
        'Hereditário',
        'Terror Psicológico',
        'Ari Aster',
        'Toni Collette, Gabriel Byrne, ...',
        'A família Graham, após a morte da avó, confronta segredos sombrios. Lidando com a dor, Annie e sua filha exploram o sobrenatural, enquanto a matriarca continua a influenciar a casa. À medida que o terror cresce, revelações perturbadoras ligam experiências sobrenaturais aos traumas geracionais da família.',
        '1/5',
        'https://tse2.explicit.bing.net/th?id=OIP.GIQ7nuEpMHqwxQcSBdxjiQHaD4&pid=Api&P=0&h=180',
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
                Navigator.of(context).pop(); // Voltar para a tela anterior
              },
              color: const Color(0xFF5E548E),
              iconSize: 30,
            ),
            title: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Text(
                'Não Assistidos',
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
                        builder: (context) => UnwatchedMovieDetailsScreen(
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

  Widget MovieCard(UnwatchedMovies movie) {
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

class UnwatchedMovieDetailsScreen extends StatelessWidget {
  final UnwatchedMovies movie;

  UnwatchedMovieDetailsScreen({required this.movie});

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