import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/repositories/values_repository.dart';

class FilmsRepository {
  FilmsRepository();

  Dio client = Dio();

  Future<List<Film>> getFilms({String? searchQuery, required int page}) async {
    if (searchQuery == null) {
      try {
        final url =
            '${ValuesRepository.domainName}/trending/movie/day?api_key=${ValuesRepository.apiKey}&page=$page';
        final response = await client.get(url);

        return getFilmsFromResponse(response);
      } catch (e) {
        rethrow;
      }
    } else {
      try {
        final url =
            '${ValuesRepository.domainName}/search/movie?api_key=${ValuesRepository.apiKey}&query=$searchQuery&page=$page';
        final response = await client.get(url);

        return getFilmsFromResponse(response);
      } catch (e) {
        rethrow;
      }
    }
  }

  List<Film> getFilmsFromResponse(var response) {
    return List<Film>.of(
      response.data['results'].map<Film>(
        (json) => Film(
          id: json['id'].toString(),
          title: json['title'].toString(),
          releaseDate: json['release_date'].toString(),
          overview: json['overview'].toString(),
          usersFeedback: json['vote_average'].toString(),
          urlImage: '${json['poster_path']}'
                  .contains('null')
              ? 'https://www.farmingtonlibraries.org/sites/default/files/2021-07/Movie%20Night.png'
              : 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
        ),
      ),
    );
  }
}
