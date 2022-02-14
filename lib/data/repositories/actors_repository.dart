import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/models/film_staff_member.dart';
import 'package:films_app_practie/data/repositories/values_repository.dart';

class ActorsRepository {

  ActorsRepository({required this.client});

  Dio client;

  Future<List<FilmStaffMemberDataModel>> getActorsListByFilm(
      {required filmId}) async {
    List<FilmStaffMemberDataModel> staffList =
        await _getAllFilmStaffList(filmId);
    if (staffList.isNotEmpty) {
      return _getActorsList(staffList);
    } else {
      return List.empty();
    }
  }

  List<FilmStaffMemberDataModel> _getActorsList(
      List<FilmStaffMemberDataModel> staffList) {
    for (int i = 0; i < staffList.length; i++) {
      if (staffList[i].position != 'Acting') {
        staffList.removeAt(i);
      }
    }
    return staffList;
  }

  Future<List<FilmStaffMemberDataModel>> _getAllFilmStaffList(
      String filmId) async {
    try {
      final url =
          '${ValuesRepository.domainName}/movie/$filmId/credits?api_key=${ValuesRepository.apiKey}';
      final response = await client.get(url);

      return response.data['cast']
          .map<FilmStaffMemberDataModel>(
            (json) => FilmStaffMemberDataModel(
              id: json['id'].toString(),
              name: json['name'].toString(),
              gender: json['gender'].toString(),
              character: json['character'].toString(),
              urlImage:
                  'https://image.tmdb.org/t/p/w185${json['profile_path']}',
              position: json['known_for_department'].toString(),
            ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<ActorDataModel> getActorInfo(String actorId) async {
    try {
      var url =
          '${ValuesRepository.domainName}/person/$actorId?api_key=${ValuesRepository.apiKey}&language=en-US';
      final response = await client.get(url);

      ActorDataModel actorDataModel = ActorDataModel(
        id: response.data['id'].toString(),
        name: response.data['name'].toString(),
        gender: response.data['gender'].toString(),
        about: response.data['biography'].toString(),
        placeOfBirth: response.data['place_of_birth'].toString(),
        urlImage:
            'https://image.tmdb.org/t/p/w185${response.data['profile_path']}',
      );
      return actorDataModel;
    } catch (e) {
      rethrow;
    }
  }
}
