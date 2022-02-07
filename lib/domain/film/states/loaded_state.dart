part of '../cubit/film_details_cubit.dart';


class LoadedFilmDetailsState extends FilmDetailsBaseState {
  LoadedFilmDetailsState({required this.film, this.actorList});

  final Film film;
  final List<FilmStaffMember>? actorList;

  @override
  List<Object?> get props => [film, actorList];
}