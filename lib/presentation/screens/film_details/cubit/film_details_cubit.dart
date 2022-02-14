import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/repositories/actors_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../../data/mappers.dart';
import '../../../models/film.dart';
import '../../../models/film_staff_member.dart';

part '../states/base_film_state.dart';

part '../states/error_state.dart';

part '../states/initial_state.dart';

part '../states/loaded_state.dart';

part '../states/loading_state.dart';

class FilmDetailsCubit extends Cubit<FilmDetailsBaseState> {
  FilmDetailsCubit({
    required this.film,
  }) : super(InitialFilmDetailsState()) {
    loadFilmInfo();
  }

  final FilmUIModel film;

  void loadFilmInfo() async {
    try {
      emit(LoadingFilmDetailsState());
      final actorsList = await GetIt.instance<ActorsRepository>().getActorsListByFilm(filmId: film.id);
      emit(LoadedFilmDetailsState(film: film, actorList: mapDataFilmStaffMemberListToUI(actorsList)));
    } catch (e) {
      emit(ErrorFilmDetailsState(error: e.toString()));
    }
  }
}
