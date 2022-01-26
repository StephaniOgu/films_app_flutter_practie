import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/domain/films_list/cubit/films_list_cubit.dart';
import 'package:films_app_practie/localisation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBlocBuilder(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  BlocBuilder<FilmsListCubit, FilmsListBaseState> _buildBlocBuilder() {
    return BlocBuilder<FilmsListCubit, FilmsListBaseState>(
      builder: (context, state) {
        if (state is LoadingFilmsListState) {
          return _buildLoadingScreen();
        } else if (state is ErrorFilmsListState) {
          return _buildErrorScreen(state);
        } else if (state is LoadedFilmsListState) {
          final movies = state.films;
          return _buildLoadedScreen(movies!);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorScreen(ErrorFilmsListState state) {
    return Center(
      child: Text(state.error),
    );
  }

  Widget _buildLoadedScreen(List<Film> movies) {
    return SafeArea(
      minimum: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildScreenTitle(),
          _buildSizedBox(),
          Expanded(
            child: _buildFilmsList(movies),
          )
        ],
      ),
    );
  }

  SizedBox _buildSizedBox() {
    return const SizedBox(
      height: 10,
      width: 10,
    );
  }

  Widget _buildScreenTitle() {
    return Text(
      FilmsLocalizations.filmListScreenTitle,
      style: Theme.of(context).textTheme.headline2,
    );
  }

  Widget _buildFilmsList(List<Film> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) => SizedBox(
        height: 150,
        child: _buildFilmItem(movies[index]),
      ),
    );
  }

  Widget _buildFilmItem(Film film) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFilmImage(film),
          _buildFilmInfo(film),
          _buildFilmRating(film),
          _buildSizedBox(),
        ],
      ),
    );
  }

  Widget _buildFilmImage(Film film) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        film.urlImage,
      ),
    );
  }

  Widget _buildFilmInfo(Film film) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildSizedBox(),
        Text(
          film.title,
          style: Theme.of(context).textTheme.headline3,
        ),
        _buildSizedBox(),
        Text(
          'Date: ${film.releaseDate}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }

  Widget _buildFilmRating(Film film) {
    return Text('${film.usersFeedback}%',
        style: Theme.of(context).textTheme.subtitle1);
  }
}
