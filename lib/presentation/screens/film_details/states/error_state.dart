part of '../cubit/film_details_cubit.dart';


class ErrorFilmDetailsState extends FilmDetailsBaseState {
  ErrorFilmDetailsState({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}