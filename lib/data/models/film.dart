import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class Film extends Equatable {
  const Film({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.usersFeedback,
    required this.urlImage,
    required this.overview,
  });

  final String id;
  final String title;
  final String releaseDate;
  final String overview;
  final double usersFeedback;
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
