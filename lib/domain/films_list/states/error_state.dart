part of '../cubit/films_list_cubit.dart';


class ErrorFilmsListState extends FilmsListBaseState {
  ErrorFilmsListState({required this.error});

  final String error;

  @override
  List<Object> get props => [];
}