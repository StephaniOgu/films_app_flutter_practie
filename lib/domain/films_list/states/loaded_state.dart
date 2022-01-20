part of '../cubit/films_list_cubit.dart';


class LoadedFilmsListState extends FilmsListBaseState {
  LoadedFilmsListState({this.films});

  final List<Film>? films;

  @override
  List<Object> get props => [films??[]];
}