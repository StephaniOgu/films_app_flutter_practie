part of '../cubit/films_list_cubit.dart';


class LoadedFilmState extends FilmBaseState {
  LoadedFilmState({required this.film, this.actorList});

  final Film film;
  final List<FilmStaffMember>? actorList;

  @override
  List<Object?> get props => [film, actorList];
}