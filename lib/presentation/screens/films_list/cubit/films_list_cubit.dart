import 'package:bloc/bloc.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/repositories/films_repository.dart';
import 'package:films_app_practie/localisation.dart';
import 'package:get_it/get_it.dart';
import '../../../../data/mappers.dart';
import '../../../models/film.dart';

part '../states/base_film_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class FilmsListCubit extends Cubit<FilmsListBaseState> {
  FilmsListCubit()
      : super(const InitialFilmsListState()) {
    loadFilmsList(page: 1);
  }

  List<FilmUIModel> _filmList = [];

  void loadFilmsList({required int page, String? query}) async {
    try {
      emit(const LoadingFilmsListState());
      if (page == 1) {
        _filmList = [];
      }
      List<FilmDataModel> films =
          await GetIt.instance<FilmsRepository>().getFilms(searchQuery: query, page: page);
      for (var element in films) {
        _filmList.add(_convertDataFilmModelToUIModel(element));
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

  FilmUIModel _convertDataFilmModelToUIModel(FilmDataModel dataModel) {
    return mapFilmDataModelToUI(dataModel);
  }
}
