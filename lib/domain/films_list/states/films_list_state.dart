import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/models/film.dart';

abstract class FilmsListState extends Equatable {}

class InitialFilmsListState extends FilmsListState {
  @override
  List<Object> get props => [];
}

class LoadingFilmsListState extends FilmsListState {
  @override
  List<Object> get props => [];
}

class LoadedFilmsListState extends FilmsListState {
  LoadedFilmsListState(this.films);

  final List<FilmModel> films;

  @override
  List<Object> get props => [films];
}

class ErrorState extends FilmsListState {
  @override
  List<Object> get props => [];
}