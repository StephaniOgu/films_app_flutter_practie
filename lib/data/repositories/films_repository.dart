import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/film.dart';

class FilmsRepository {
  const FilmsRepository({required this.client});

  final Dio client;

  Future<List<Film>> getFilms() async {
    try {
      const url =
          'https://api.themoviedb.org/3/trending/movie/day?api_key=d4042a814f7ec085951eebff4536a5c6';
      final response = await client.get(url);

      return List<Film>.of(
        response.data['results'].map<Film>(
          (json) => Film(
            id: json['id'],
            title: json['title'],
            releaseDate: json['release_date'],
            overview: json['overview'],
            usersFeedback: json['vote_average'],
            urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
          ),
        ),
      );

    } catch (e) {
      rethrow;
    }
  }
}
