import 'dart:async';
import 'package:films_app_practie/presentation/screens/actor_details.dart';
import 'package:films_app_practie/presentation/screens/film_details.dart';
import 'package:films_app_practie/presentation/screens/films_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/models/film.dart';
import 'data/models/film_staff_member.dart';
import 'data/repositories/actors_repository.dart';
import 'data/repositories/films_repository.dart';
import 'domain/actor/cubit/actors_cubit.dart';
import 'domain/film/cubit/film_details_cubit.dart';
import 'domain/films_list/cubit/films_list_cubit.dart';

class AppRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Film? _selectedFilm;
  FilmStaffMember? _selectedActor;
  int _stackSize = 1;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: _buildFilmsListBlocProvider()),
        if (_selectedFilm != null)
          MaterialPage(child: _buildFilmDetailsBlocProvider(_selectedFilm!)),
        if (_selectedActor != null)
          MaterialPage(child: _buildActorDetailsBlocProvider(_selectedActor)),
      ],
      onPopPage: (route, result) {
        switch (_stackSize) {
          case 2:
            _selectedFilm = null;
            --_stackSize;
            break;
          case 3:
            _selectedActor = null;
            --_stackSize;
            break;
        }

        //TODO: to understand;
        if (!route.didPop(result)) {
          return false;
        }
        return true;
      },
    );
  }

  BlocProvider<FilmsListCubit> _buildFilmsListBlocProvider() {
    return BlocProvider<FilmsListCubit>(
      create: (context) => FilmsListCubit(
        filmsRepository: FilmsRepository(),
      ),
      child: FilmsListPage(
        onFilmTap: _onFilmTap,
      ),
    );
  }

  void _onFilmTap(Film film) {
    _selectedFilm = film;
    ++_stackSize;
    notifyListeners();
  }

  BlocProvider<FilmDetailsCubit> _buildFilmDetailsBlocProvider(Film film) {
    return BlocProvider<FilmDetailsCubit>(
      create: (context) => FilmDetailsCubit(
        actorsRepository: ActorsRepository(),
        film: film,
      ),
      child: FilmsDetailsPage(
        onActorTap: _onActorTap,
      ),
    );
  }

  void _onActorTap(FilmStaffMember actor) {
    _selectedActor = actor;
    ++_stackSize;
    notifyListeners();
  }

  BlocProvider<ActorDetailsCubit> _buildActorDetailsBlocProvider(
      FilmStaffMember? actor) {
    return BlocProvider<ActorDetailsCubit>(
      create: (context) => ActorDetailsCubit(
        actorsRepository: ActorsRepository(),
        actorId: actor!.id,
      ),
      child: const ActorDetailsPage(
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
