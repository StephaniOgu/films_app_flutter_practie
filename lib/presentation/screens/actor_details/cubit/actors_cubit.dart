import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/mappers.dart';
import 'package:films_app_practie/data/repositories/actors_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../models/actor.dart';

part '../states/base_actor_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class ActorDetailsCubit extends Cubit<ActorDetailsBaseState> {
  ActorDetailsCubit({
    required this.actorsRepository,
    required this.actorId,
  }) : super(InitialActorDetailsState()) {
    loadActorInfo(actorId);
  }

  final ActorsRepository actorsRepository;
  final String actorId;

  void loadActorInfo(String actorId) async {
    try {
      emit(LoadingActorDetailsState());
      final actor =
          mapActorDataModelToUI(await actorsRepository.getActorInfo(actorId));
      emit(LoadedActorDetailsState(actor: actor));
    } catch (e) {
      emit(ErrorActorDetailsState(error: e.toString()));
    }
  }
}
