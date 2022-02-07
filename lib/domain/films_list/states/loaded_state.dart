part of '../cubit/films_list_cubit.dart';


class LoadedFilmsListState extends FilmsListBaseState {
  LoadedFilmsListState({this.films, this.page = 1, this.query});

  final List<Film>? films;
  final int page;
  final String? query;

  @override
  List<Object> get props => [films!, page, query!];
}