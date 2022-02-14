part of '../cubit/films_list_cubit.dart';

class LoadedFilmsListState extends FilmsListBaseState {
  const LoadedFilmsListState({this.films, int page = 1, String? query})
      : super(page: page, query: query);

  final List<FilmUIModel>? films;

  @override
  List<Object> get props => [films!, page, query!];
}
