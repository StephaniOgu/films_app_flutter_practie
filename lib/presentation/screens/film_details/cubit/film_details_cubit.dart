import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:films_app_practie/data/repositories/actors_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:url_launcher/url_launcher.dart';

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
    required this.actorsRepository
  }) : super(InitialFilmDetailsState()) {
    loadFilmInfo();
  }

  final FilmUIModel film;
  final ActorsRepository actorsRepository;

  void loadFilmInfo() async {
    try {
      emit(LoadingFilmDetailsState());
      final actorsList = await actorsRepository.getActorsListByFilm(filmId: film.id);
      emit(LoadedFilmDetailsState(film: film, actorList: mapDataFilmStaffMemberListToUI(actorsList)));
    } catch (e) {
      emit(ErrorFilmDetailsState(error: e.toString()));
    }
  }

  launchURL({required String url}) async {
    await launch(url);
  }
}
