part of '../cubit/films_list_cubit.dart';

class ErrorFilmsListState extends FilmsListBaseState {
  const ErrorFilmsListState({required this.error}) : super(page: 1);

  final String? error;

  @override
  List<Object> get props => [error!];
}
