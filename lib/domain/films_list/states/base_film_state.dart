part of '../cubit/films_list_cubit.dart';

@immutable
abstract class FilmsListBaseState extends Equatable {
  late final page;
  late final isLast;
  late final query;
}







