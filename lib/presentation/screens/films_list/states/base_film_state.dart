part of '../cubit/films_list_cubit.dart';

class FilmsListBaseState extends Equatable {
  const FilmsListBaseState({this.query, required this.page});

  final int page;
  final String? query;

  @override
  List<Object?> get props => [page, query];
}
