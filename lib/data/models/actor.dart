import 'package:equatable/equatable.dart';

class Actor extends Equatable {
  const Actor({
    required this.name,
    required this.sex,
    required this.birthday,
    required this.place,
    required this.about,
  });

  final String name;
  final String sex;
  final DateTime birthday;
  final String place;
  final String about;

  @override
  List<Object> get props => [
        name,
        sex,
        birthday,
        birthday,
        place,
        about,
      ];

  Actor copyWith({
    String? name,
    String? sex,
    DateTime? birthday,
    String? place,
    String? about,
  }) {
    return Actor(
      name: name ?? this.name,
      sex: sex ?? this.sex,
      birthday: birthday ?? this.birthday,
      place: place ?? this.place,
      about: about ?? this.about,
    );
  }
}
