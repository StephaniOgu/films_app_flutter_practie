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

  FilmsListCubit({required this.filmsRepository})
      : super(InitialFilmsListState()) {
    loadFilmsList(page: 1);
  }

  final FilmsRepository filmsRepository;

  void loadFilmsList({required int page}) async {
    try {
      emit(LoadingFilmsListState());
      final films = await filmsRepository.getFilms(page: page);
      var isLastPage = await _isPageLast(page, null);
      emit(LoadedFilmsListState(films: films, page:page, isLast: isLastPage));
    } catch (e) {
      emit(ErrorFilmsListState(error: e.toString()));
    }
  }

  void searchFilms({String? query, required int page}) async {
    try {
      emit(LoadingFilmsListState());
      final films = await filmsRepository.getFilms(searchQuery: query, page: page);
      var isLastPage = await _isPageLast(page, query);
      emit(LoadedFilmsListState(films: films, page: page, isLast: isLastPage, query: query));
    } catch (e) {
      loadFilmsList(page: page);
    }
  }

  Future<bool> _isPageLast(int currentPage, String? query)async {
    try{
      await filmsRepository.getFilms(page: currentPage+1, searchQuery: query);
      return false;
    }catch (ex){
      return true;
    }
  }
}
