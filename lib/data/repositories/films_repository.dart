import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/repositories/values_repository.dart';

class FilmsRepository {
  FilmsRepository({required this.client});

  final Dio client;

  Future<List<Film>> getFilms() async {
    try {
      final url =
          '${ValuesRepository.domainName}/trending/movie/day?api_key=${ValuesRepository.apiKey}';
      final response = await client.get(url);

      return List<Film>.of(
        response.data['results'].map<Film>(
          (json) => Film(
            id: json['id'].toString(),
            title: json['title'].toString(),
            releaseDate: json['release_date'],
            overview: json['overview'].toString(),
            usersFeedback: json['vote_average'],
            urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
          ),
        ),
      );
    }
    catch (e) {
      rethrow;
    }
  }
}
