import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/repositories/values_repositorty.dart';

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
          '${ValuesRepository.domainName}/movie/$filmId/credits?api_key=${ValuesRepository.apiKey}';
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
          '${ValuesRepository.domainName}/person/$actorId?api_key=${ValuesRepository.apiKey}&language=en-US';
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
