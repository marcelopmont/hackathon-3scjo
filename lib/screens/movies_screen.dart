import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_3scjo/models/movie.dart';
import 'package:http/http.dart';

class MoviesScreen extends StatefulWidget {
  static const String id = '/movies';

  MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<Movie> moviesList = [];

  @override
  void initState() {
    super.initState();

    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Melhores filmes'),
        ),
        body: ListView.separated(
          itemCount: moviesList.length,
          itemBuilder: (context, index) {
            final movie = moviesList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: Material(
                  elevation: 8,
                  borderRadius: BorderRadius.circular(16),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                        child: Image.network(movie.image),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              movie.description,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        ));
  }

  void fetchMovies() async {
    final uri = Uri.parse('https://demo7206081.mockable.io/movies');
    Response response = await Client().get(uri);

    final responseJson = jsonDecode(response.body);

    moviesList = responseJson['results']
        .map<Movie>(
          (json) => Movie(
            name: json['original_title'],
            description: json['overview'],
            image: json['poster_path'],
            rating: json['vote_average'].toString(),
          ),
        )
        .toList();

    setState(() => {});
  }
}
