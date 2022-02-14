import 'dart:async';
import 'package:dio/dio.dart';
import 'package:films_app_practie/presentation/models/film.dart';
import 'package:films_app_practie/presentation/models/film_staff_member.dart';
import 'package:films_app_practie/presentation/screens/actor_details/actor_details.dart';
import 'package:films_app_practie/presentation/screens/actor_details/cubit/actors_cubit.dart';
import 'package:films_app_practie/presentation/screens/film_details/film_details.dart';
import 'package:films_app_practie/presentation/screens/films_list/films_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/actors_repository.dart';
import 'data/repositories/films_repository.dart';
import 'package:films_app_practie/presentation/screens/film_details/cubit/film_details_cubit.dart';
import 'package:films_app_practie/presentation/screens/films_list/cubit/films_list_cubit.dart';

class AppRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<String> {
  Dio client = Dio();

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  FilmUIModel? _selectedFilm;
  FilmStaffMemberUIModel? _selectedActor;
  int _stackSize = 1;

  @override
  Widget build(BuildContext context) {
    if (!GetIt.I.isRegistered<ActorsRepository>()) {
      GetIt.I.registerSingleton<ActorsRepository>(
          ActorsRepository(client: client));
    }

    if (!GetIt.I.isRegistered<FilmsRepository>()) {
      GetIt.I.registerSingleton<FilmsRepository>(
          FilmsRepository(client: client));
    }

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
      ),
      child: FilmsListPage(
        onFilmTap: _onFilmTap,
      ),
    );
  }

  void _onFilmTap(FilmUIModel film) {
    _selectedFilm = film;
    ++_stackSize;
    notifyListeners();
  }

  BlocProvider<FilmDetailsCubit> _buildFilmDetailsBlocProvider(
      FilmUIModel film) {
    return BlocProvider<FilmDetailsCubit>(
      create: (context) => FilmDetailsCubit(
        film: film,
      ),
      child: FilmsDetailsPage(
        onActorTap: _onActorTap,
      ),
    );
  }

  void _onActorTap(FilmStaffMemberUIModel actor) {
    _selectedActor = actor;
    ++_stackSize;
    notifyListeners();
  }

  BlocProvider<ActorDetailsCubit> _buildActorDetailsBlocProvider(
      FilmStaffMemberUIModel? actor) {
    return BlocProvider<ActorDetailsCubit>(
      create: (context) => ActorDetailsCubit(
        actorId: actor!.id,
      ),
      child: const ActorDetailsPage(),
    );
  }

  @override
  Future<void> setNewRoutePath(String configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
