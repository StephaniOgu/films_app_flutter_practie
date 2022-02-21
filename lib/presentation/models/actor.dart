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

  ActorUIModel copyWith({
    String? name,
    String? gender,
    String? about,
    String? placeOfBirth,
    String? urlImage,
  }) {
    return ActorUIModel(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      about: about ?? this.about,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      urlImage: urlImage ?? this.urlImage,
    );
  }
}
