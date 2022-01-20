import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/models/actor.dart';

class FilmModel extends Equatable {
  const FilmModel({
    required this.title,
    required this.year,
    required this.length,
    required this.actorList,
    required this.usersFeedback,
    required this.overview,
  });

  final String title;
  final int year;
  final int length;
  final String overview;
  final int usersFeedback;
  final List<Actor> actorList;

  @override
  List<Object> get props => [
        title,
        year,
        length,
        actorList,
        usersFeedback,
        overview,
      ];

  FilmModel copyWith({
    String? title,
    int? year,
    int? length,
    String? overview,
    int? usersFeedback,
    List<Actor>? actorList,
  }) {
    return FilmModel(
      title: title ?? this.title,
      year: year ?? this.year,
      length: length ?? this.length,
      overview: overview ?? this.overview,
      usersFeedback: usersFeedback ?? this.usersFeedback,
      actorList: actorList ?? this.actorList,
    );
  }
}
