import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FilmModel extends Equatable {
  const FilmModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.usersFeedback,
    required this.urlImage,
    required this.overview,
  });

  final String id;
  final String title;
  final int releaseDate;
  final String overview;
  final int usersFeedback;
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
