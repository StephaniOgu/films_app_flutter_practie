import 'package:bloc/bloc.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/repositories/films_repository.dart';
import 'package:films_app_practie/domain/router/cubit/router_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../localisation.dart';

part '../states/base_film_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class FilmsListCubit extends Cubit<FilmsListBaseState> {
  FilmsListCubit({required this.filmsRepository})
      : super(InitialFilmsListState()) {
    loadFilmsList(page: 1);
  }

  List<Film> _filmList = [];

  final FilmsRepository filmsRepository;

  void loadFilmsList({required int page, String? query}) async {
    try {
      emit(LoadingFilmsListState());
      if (page == 1) {
        _filmList = [];
      }
      List<Film> films =
          await filmsRepository.getFilms(searchQuery: query, page: page);
      for (var element in films) {
        _filmList.add(element);
      }
      if (_filmList.isEmpty) {
        emit(ErrorFilmsListState(error: FilmsLocalizations.noResults));
        return;
      }
      emit(LoadedFilmsListState(films: _filmList, page: page, query: query));
    } catch (e) {
      emit(ErrorFilmsListState(error: e.toString()));
    }
  }

  Future<bool> _isPageLast({required int currentPage, String? query}) async {
    try {
      var films = await filmsRepository.getFilms(
          page: currentPage + 1, searchQuery: query);
      if (films.isNotEmpty) {
        return false;
      }
    } catch (ex) {
      return true;
    }
    return true;
  }
}
