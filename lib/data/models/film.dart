import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FilmDataModel extends Equatable {
  const FilmDataModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.usersFeedback,
    required this.urlImage,
  });

  final String id;
  final String title;
  final String releaseDate;
  final String overview;
  final String usersFeedback;
  final String urlImage;

  @override
  List<Object> get props => [
        id,
        title,
        releaseDate,
        overview,
        usersFeedback,
        urlImage,
      ];
}
