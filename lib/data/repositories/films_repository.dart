import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/repositories/values_repository.dart';


class FilmsRepository {
  FilmsRepository({required this.client});

  final Dio client;

  Future<List<FilmDataModel>> getFilms(
      {String? searchQuery, required page}) async {
    try {
      if (searchQuery == null) {
        final url =
            '${ValuesRepository.domainName}/trending/movie/day?api_key=${ValuesRepository.apiKey}&page=$page';
        return _getFilmsFromResponse(await client.get(url));
      } else {
        final url =
            '${ValuesRepository.domainName}/search/movie?api_key=${ValuesRepository.apiKey}&query=$searchQuery&page=$page';
        return _getFilmsFromResponse(await client.get(url));
      }
    } catch (e) {
      rethrow;
    }
  }

  List<FilmDataModel> _getFilmsFromResponse(var response) {
    return response.data['results']
        .map<FilmDataModel>(
          (json) => FilmDataModel(
            id: json['id'].toString(),
            title: json['title'].toString(),
            releaseDate: json['release_date'].toString(),
            overview: json['overview'].toString(),
            usersFeedback: json['vote_average'].toString(),
            urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
          ),
        )
        .toList();
  }
}
