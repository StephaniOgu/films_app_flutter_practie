import 'package:dio/dio.dart';
import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/models/film_staff_member.dart';
import 'package:films_app_practie/data/repositories/values_repository.dart';

class ActorsRepository {
  ActorsRepository();

  Dio client = Dio();

  Future<List<FilmStaffMember>> getActorsListByFilm({required filmId}) async {
    List<FilmStaffMember> staffList = await _getAllFilmStaffList(filmId);
    if (staffList.isNotEmpty) {
      return _getActorsList(staffList);
    } else {
      return [];
    }
  }

  List<FilmStaffMember> _getActorsList(List<FilmStaffMember> staffList) {
    for (int i = 0; i < staffList.length; i++) {
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
            character: json['character'].toString(),
            urlImage: '${json['profile_path']}'.contains('null') &&
                    '${json['gender']}' == '1'
                ? 'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg'
                : '${json['profile_path']}'.contains('null')
                    ? 'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg'
                    : 'https://image.tmdb.org/t/p/w185${json['profile_path']}',
            position: json['known_for_department'].toString(),
          ),
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Actor> getActorInfo(String actorId) async {
    try {
      var url =
          '${ValuesRepository.domainName}/person/$actorId?api_key=${ValuesRepository.apiKey}&language=en-US';
      final response = await client.get(url);

      return Actor(
        id: response.data['id'].toString(),
        name: response.data['name'],
        gender: response.data['gender'] == '1'.toString() ? 'Female' : 'Male',
        about: response.data['biography'],
        placeOfBirth: response.data['place_of_birth'],
        urlImage: response.data['profile_path'] == null &&
                response.data['gender'].toString() == '1'
            ? 'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg'
            : response.data['profile_path']== null
                ? 'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg'
                : 'https://image.tmdb.org/t/p/w185${response.data['profile_path']}',
      );
    } catch (e) {
      rethrow;
    }
  }
}
