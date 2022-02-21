part of '../cubit/film_details_cubit.dart';


class LoadedFilmDetailsState extends FilmDetailsBaseState {
  LoadedFilmDetailsState({required this.film, this.actorList});

  final FilmUIModel film;
  final List<FilmStaffMemberUIModel>? actorList;

  @override
  List<Object?> get props => [film, actorList];
}