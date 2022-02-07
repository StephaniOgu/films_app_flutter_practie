import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/domain/actor/cubit/actors_cubit.dart';
import 'package:films_app_practie/domain/film/cubit/film_details_cubit.dart';
import 'package:films_app_practie/domain/films_list/cubit/films_list_cubit.dart';

part '../states/router_base_state.dart';

part '../router_state.dart';

class RouterCubit extends Cubit<RouterState> {
  RouterCubit() : super(FilmsListBaseState());

  void goToFilmsList([String? text]) => emit(FilmsListBaseState());

  void goToFilmsDetails([String? text]) => emit(FilmDetailsBaseState());

  void goToActorDetails([String? text]) => emit(ActorDetailsBaseState());

  void popExtra() {
    if (state is FilmDetailsBaseState) {
      goToFilmsDetails();
    } else if (state is ActorDetailsBaseState) {
      goToActorDetails();
    } else {
      goToFilmsList();
    }
  }
}
