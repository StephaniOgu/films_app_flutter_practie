import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/repositories/films_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part '../states/base_film_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class FilmsListCubit extends Cubit<FilmsListBaseState> {
  FilmsListCubit({required this.filmsRepository}) : super(InitialFilmsListState()) {
    loadFilmsList();
  }

  final FilmsRepository filmsRepository;

  void loadFilmsList() async {
    try {
      emit(LoadingFilmsListState());
      final films = await filmsRepository.getFilms();
      emit(LoadedFilmsListState(films: films));
    } catch (e) {
      emit(ErrorFilmsListState(error: e.toString()));
    }
  }
}
