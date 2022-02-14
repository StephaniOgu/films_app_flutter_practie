import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FilmStaffMemberUIModel extends Equatable {
  const FilmStaffMemberUIModel(
      {required this.id, required this.name, required this.character, required this.urlImage});
  final String id;
  final String name;
  final String character;
  final String urlImage;

  @override
  List<Object> get props => [
        id,
        name,
        character,
        urlImage,
      ];
}
