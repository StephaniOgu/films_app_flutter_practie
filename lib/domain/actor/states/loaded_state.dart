part of '../cubit/actors_cubit.dart';


class LoadedActorDetailsState extends ActorDetailsBaseState {
  LoadedActorDetailsState({ required this.actor});

  final Actor actor;

  @override
  List<Object> get props => [actor];
}