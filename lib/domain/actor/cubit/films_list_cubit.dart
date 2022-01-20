import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/repositories/actors_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part '../states/base_actor_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class ActorCubit extends Cubit<ActorBaseState> {
  ActorCubit({
    required this.actorsRepository,
    required this.actorId,
  }) : super(InitialActorListState()) {
    loadActorInfo(actorId);
  }

  final ActorsRepository actorsRepository;
  final String actorId;

  void loadActorInfo(String actorId) async {
    try {
      emit(LoadingActorListState());
      final actor = await actorsRepository.getActorInfo(actorId);
      emit(LoadedActorListState(actor: actor));
    } catch (e) {
      emit(ErrorActorState(error: e.toString()));
    }
  }
}
