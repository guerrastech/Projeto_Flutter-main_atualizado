import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



//Tela de escolha de gêneros

class Genre {
  final String name;
  final String emoji;

  Genre({required this.name, required this.emoji});
}

class GenreScreen extends StatefulWidget {
  const GenreScreen({Key? key}) : super(key: key);

  @override
  _GenreScreenState createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  final List<bool> _isSelected = List.generate(12, (_) => false);

  final List<Genre> genres = [
    Genre(name: 'Musical', emoji: '🎶'),
    Genre(name: 'Ação', emoji: '💥'),
    Genre(name: 'Comédia', emoji: '🤣'),
    Genre(name: 'Romance', emoji: '🥰'),
    Genre(name: 'Drama', emoji: '😳'),
    Genre(name: 'Ficção Científica', emoji: '👽'),
    Genre(name: 'Animação', emoji: '😄'),
    Genre(name: 'Fantasia', emoji: '😴'),
    Genre(name: 'Documentário', emoji: '📖'),
    Genre(name: 'Terror', emoji: '😱'),
    Genre(name: 'Aventura', emoji: '🤠'),
    Genre(name: 'História', emoji: '🦖'),
  ];

  @override
  Widget build(BuildContext context) {
    int halfLength = (genres.length / 2).ceil();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 50,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop(); // Voltar para a tela anterior
                  },
                  color: const Color(0xFF5E548E),
                  iconSize: 30,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        width: 34,
                        height: 34,
                        child: Image.asset('assets/images/img_claquete.png'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        child: Text(
                          'ClackMovie',
                          style: GoogleFonts.poppins().copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(45),
            child: Text(
              'Quais tipos de filmes você gosta?',
              style: GoogleFonts.poppins(fontSize: 18),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: halfLength,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _isSelected[index]
                                ? const Color(0xFF5E548E)
                                : Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _isSelected[index] = !_isSelected[index];
                            });
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Text(
                                  genres[index].emoji,
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(width: 16),
                                Text(genres[index].name),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: halfLength,
                    itemBuilder: (context, index) {
                      int newIndex = index + halfLength;
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _isSelected[newIndex]
                                ? const Color(0xFF5E548E)
                                : Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _isSelected[newIndex] = !_isSelected[newIndex];
                            });
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Text(
                                  genres[newIndex].emoji,
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(width: 16),
                                Text(genres[newIndex].name),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}