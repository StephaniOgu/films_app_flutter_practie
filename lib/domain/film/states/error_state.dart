part of '../cubit/films_list_cubit.dart';


class ErrorFilmState extends FilmBaseState {
  ErrorFilmState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}