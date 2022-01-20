part of '../cubit/films_list_cubit.dart';


class LoadedActorListState extends ActorBaseState {
  LoadedActorListState({ required this.actor});

  final FilmStaffMember actor;

  @override
  List<Object> get props => [actor];
}