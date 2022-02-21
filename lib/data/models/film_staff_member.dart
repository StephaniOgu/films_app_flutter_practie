import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class FilmStaffMemberDataModel extends Equatable {
  const FilmStaffMemberDataModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.character,
    required this.urlImage,
    required this.position,
  });

  final String id;
  final String name;
  final String gender;
  final String character;
  final String urlImage;
  final String position;

  @override
  List<Object> get props => [
        id,
        name,
        gender,
        character,
        urlImage,
        position,
      ];

  FilmStaffMemberDataModel copyWith({
    String? id,
    String? name,
    String? gender,
    String? character,
    String? urlImage,
    String? position,
  }) {
    return FilmStaffMemberDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      character: character ?? this.character,
      urlImage: urlImage ?? this.urlImage,
      position: position ?? this.position,
    );
  }
}
