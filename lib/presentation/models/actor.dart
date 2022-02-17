import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class ActorUIModel extends Equatable {
  const ActorUIModel({
    required this.name,
    required this.gender,
    required this.about,
    required this.placeOfBirth,
    required this.urlImage,
  });

  final String name;
  final String gender;
  final String about;
  final String placeOfBirth;
  final String urlImage;

  @override
  List<Object> get props => [
        name,
        gender,
        about,
        placeOfBirth,
        urlImage,
      ];
}

/*
.map<FilmStaffMemberDataModel>(
            (json) => FilmStaffMemberDataModel(
              id: json['id'].toString(),
              name: json['name'].toString(),
              character: json['character'].toString(),
              urlImage:
              position: json['known_for_department'].toString(),
            ),



        List<FilmDataModel> getFilmsFromResponse(var response) {
    return response.data['results']
        .map<FilmDataModel>(
          (json) => FilmDataModel(
            id: json['id'].toString(),
            title: json['title'].toString(),
            releaseDate: json['release_date'].toString(),
            overview: json['overview'].toString(),
            usersFeedback: json['vote_average'].toString(),
            urlImage: ,
          ),
        )
        .toList();
  }
 */
