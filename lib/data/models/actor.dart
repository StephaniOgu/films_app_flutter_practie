import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FilmStaffMember extends Equatable {
  const FilmStaffMember({
    required this.id,
    required this.name,
    required this.gender,
    required this.birthday,
    required this.placeOfBirth,
    required this.about,
    required this.urlImage,
    required this.position,
  });

  final String id;
  final String name;
  final String gender;
  final DateTime birthday;
  final String placeOfBirth;
  final String about;
  final String urlImage;
  final String position;

  @override
  List<Object> get props =>
      [
        id,
        name,
        gender,
        birthday,
        birthday,
        placeOfBirth,
        about,
        urlImage,
      ];
}
