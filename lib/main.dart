import 'package:films_app_practie/data/repositories/films_repository.dart';
import 'package:films_app_practie/domain/films_list/cubit/films_list_cubit.dart';
import 'package:films_app_practie/presentation/screens/films_list_page.dart';
import 'package:films_app_practie/presentation/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const FilmsApp());
}

class FilmsApp extends StatefulWidget {
  const FilmsApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilmsAppState();
  }
}

class _FilmsAppState extends State<FilmsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FilmsAppTheme.lightTheme,
      darkTheme: FilmsAppTheme.darkTheme,
      home: _buildBlocProvider(),
    );
  }

  BlocProvider<FilmsListCubit> _buildBlocProvider() {
    return BlocProvider<FilmsListCubit>(
      create: (context) => FilmsListCubit(
        filmsRepository: FilmsRepository(
        ),
      ),
      child: const MoviesPage(),
    );
  }
}
