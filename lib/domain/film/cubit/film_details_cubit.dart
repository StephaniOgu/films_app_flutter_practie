import 'package:bloc/bloc.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/models/film_staff_member.dart';
import 'package:films_app_practie/data/repositories/actors_repository.dart';
import 'package:films_app_practie/domain/router/cubit/router_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part '../states/base_film_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class FilmDetailsCubit extends Cubit<FilmDetailsBaseState> {
  FilmDetailsCubit({
    required this.film,
    required this.actorsRepository,
  }) : super(InitialFilmDetailsState()) {
    loadFilmInfo();
  }

  final Film film;
  final ActorsRepository actorsRepository;

  void loadFilmInfo() async {
    try {
      emit(LoadingFilmDetailsState());
      final actorsList = await actorsRepository.getActorsListByFilm(filmId: film.id);
      emit(LoadedFilmDetailsState(film: film, actorList: actorsList));
    } catch (e) {
      emit(ErrorFilmDetailsState(error: e.toString()));
    }
  }
}
