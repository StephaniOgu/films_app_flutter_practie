import 'package:dio/dio.dart';
import 'package:films_app_practie/presentation/themes/theme.dart';
import 'package:films_app_practie/router_delegate.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/actors_repository.dart';
import 'data/repositories/films_repository.dart';
void main() {
  runApp(const FilmsApp());
}

class FilmsApp extends StatefulWidget {
  const FilmsApp({Key? key}) : super(key: key);

  @override
  State<FilmsApp> createState() => _FilmsAppState();
}

class _FilmsAppState extends State<FilmsApp> {
  @override
  void initState() {
    GetIt.I.registerSingleton<Dio>(Dio());
    final client = GetIt.I<Dio>();

    GetIt.I
        .registerSingleton<ActorsRepository>(ActorsRepository(client: client));
    GetIt.I.registerSingleton<FilmsRepository>(FilmsRepository(client: client));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FilmsAppTheme.lightTheme,
      darkTheme: FilmsAppTheme.darkTheme,
      home: Router(
        backButtonDispatcher: RootBackButtonDispatcher(),
        routerDelegate: AppRouterDelegate(),
      ), // _buildBlocProvider(),
    );
  }
}
