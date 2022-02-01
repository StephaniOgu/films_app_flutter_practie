part of '../cubit/films_list_cubit.dart';


class LoadedFilmsListState extends FilmsListBaseState {
  LoadedFilmsListState({this.films, this.page = 1, this.isLast = false, this.query});

  final List<Film>? films;
  final int page;
  final bool isLast;
  final String? query;

  @override
  List<Object> get props => [films??[]];
}