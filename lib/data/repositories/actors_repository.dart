import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/repositories/values_repository.dart';

class ActorsRepository {
  ActorsRepository();

  Dio client = Dio();

  Future<List<FilmStaffMember>> getActorsListByFilm({required filmId}) async {
    List<FilmStaffMember> staffList = await _getAllFilmStaffList(filmId);
    return _getActorsList(staffList);
  }

  List<FilmStaffMember> _getActorsList(List<FilmStaffMember> staffList) {
    for(int i = 0; i<staffList.length; i++){
      if (staffList[i].position != 'Acting') {
        staffList.removeAt(i);
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
        response.data['cast'].map<FilmStaffMember>(
              (json) => FilmStaffMember(
            id: json['id'].toString(),
            name: json['name'].toString(),
            gender: json['gender'].toString(),
            character: json['character'].toString(),
            urlImage: 'https://image.tmdb.org/t/p/w185${json['profile_path']}'.toString(),
            position: json['known_for_department'].toString(),
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
                character: json['character'],
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
