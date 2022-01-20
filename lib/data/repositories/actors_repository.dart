import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/actor.dart';

class ActorsRepository {
  ActorsRepository({
    required this.client,
  });

  final Dio client;

  Future<List<FilmStaffMember>> getActorsListByFilm({required filmId}) async {
    return _getActorsList(await _getAllFilmStaffList(filmId));
  }

  List<FilmStaffMember> _getActorsList(List<FilmStaffMember> staffList) {
    for (var staffMember in staffList) {
      if (staffMember.position != 'Acting') {
        staffList.remove(staffMember);
      }
    }
    return staffList;
  }

  Future<List<FilmStaffMember>> _getAllFilmStaffList(String filmId) async {
    try {
      final url =
          'https://api.themoviedb.org/3/movie/$filmId/credits?api_key=d4042a814f7ec085951eebff4536a5c6';
      final response = await client.get(url);

      return List<FilmStaffMember>.of(
        response.data['results'].map<FilmStaffMember>(
              (json) => FilmStaffMember(
            id: json['id'],
            name: json['name'],
            gender: json['gender'],
            birthday: json['birthday'],
            placeOfBirth: json['place_of_birth'],
            about: json['biography'],
            urlImage: 'https://image.tmdb.org/t/p/w185${json['profile_path']}',
            position: json['known_for_department'],
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<FilmStaffMember> getActorInfo(String actorId) async {
    try {
      var url =
          'https://api.themoviedb.org/3/person/$actorId?api_key=d4042a814f7ec085951eebff4536a5c6&language=en-US';
      final response = await client.get(url);

      final actors = List<FilmStaffMember>.of(
        response.data['results'].map<FilmStaffMember>(
              (json) => FilmStaffMember(
                id: json['id'],
                name: json['name'],
                gender: json['gender'],
                birthday: json['birthday'],
                placeOfBirth: json['place_of_birth'],
                about: json['biography'],
                urlImage: 'https://image.tmdb.org/t/p/w185${json['profile_path']}',
                position: json['known_for_department'],
          ),
        ),
      );

      return actors[0];
    } catch (e) {
      rethrow;
    }
  }
}
