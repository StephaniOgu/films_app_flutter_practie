import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/repositories/actors_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part '../states/base_film_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class FilmsCubit extends Cubit<FilmBaseState> {
  FilmsCubit({
    required this.film,
    required this.actorsRepository,
  }) : super(InitialFilmState()) {
    loadFilmInfo();
  }

  final Film film;
  final ActorsRepository actorsRepository;

  void loadFilmInfo() async {
    try {
      emit(LoadingFilmState());
      final actorsList = await actorsRepository.getActorsListByFilm(filmId: film.id);
      emit(LoadedFilmState(film: film, actorList: actorsList));
    } catch (e) {
      emit(ErrorFilmState(error: e.toString()));
    }
  }
}
