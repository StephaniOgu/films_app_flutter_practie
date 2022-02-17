import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class ActorDataModel extends Equatable {
  const ActorDataModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.about,
    required this.placeOfBirth,
    required this.urlImage,
  });

  final String id;
  final String name;
  final String gender;
  final String about;
  final String placeOfBirth;
  final String urlImage;

  @override
  List<Object> get props => [
        id,
        name,
        gender,
        about,
        placeOfBirth,
        urlImage,
      ];
}
