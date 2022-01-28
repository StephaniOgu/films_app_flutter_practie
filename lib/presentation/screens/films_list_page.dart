import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/domain/films_list/cubit/films_list_cubit.dart';
import 'package:films_app_practie/localisation.dart';
import 'package:flutter/cupertino.dart';
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
      body: _buildBlocConsumer(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        _buildBigSizedBox(),
        _buildSearchField(),
        _buildBigSizedBox(),
        _buildSearchIcnBtn(),
        _buildLittleSizedBox(),
      ],
    );
  }

  Widget _buildBigSizedBox() {
    return const SizedBox(
      height: 10,
      width: 60,
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
            icon: const Icon(Icons.search),
            hintText: FilmsLocalizations.filmListScreenHintText,
            hintStyle: Theme.of(context).textTheme.headline5),
        onChanged: (query) {
          context.read<FilmsListCubit>().searchFilms(query);
        },
      ),
    );
  }

  IconButton _buildSearchIcnBtn() {
    return IconButton(
      onPressed: () {
        context.read<FilmsListCubit>().loadFilmsList();
      },
      icon: const Icon(Icons.close),
    );
  }

  SizedBox _buildLittleSizedBox() {
    return const SizedBox(
      height: 10,
      width: 30,
    );
  }

  BlocConsumer<FilmsListCubit, FilmsListBaseState> _buildBlocConsumer() {
    return BlocConsumer<FilmsListCubit, FilmsListBaseState>(
      listener: (context, state) {},
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
    print(state.error);
    return Center(
        child: Text(
      FilmsLocalizations.errorTitle,
      style: Theme.of(context).textTheme.bodyText1,
    ));
  }

  Widget _buildLoadedScreen(List<Film> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildScreenTitle(),
        Expanded(
          child: _buildFilmsList(movies),
        )
      ],
    );
  }

  Widget _buildScreenTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Text(
        FilmsLocalizations.filmListScreenLabel,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _buildFilmsList(List<Film> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) => _buildFilmItem(movies[index]),
      itemExtent: 150.0,
    );
  }

  Widget _buildFilmItem(Film film) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          _buildFilmCard(film),
          _buildFilmImage(film),
        ],
      ),
    );
  }

  Widget _buildFilmCard(Film film) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildBigSizedBox(),
          _buildFilmInfo(film),
          _buildFilmRating(film),
        ],
      ),
    );
  }

  Widget _buildFilmInfo(Film film) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 8),
              child: Text(
                film.title,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Date: ${film.releaseDate}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilmRating(Film film) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('${film.usersFeedback}%',
          style: Theme.of(context).textTheme.subtitle1),
    );
  }

  Widget _buildFilmImage(Film film) {
    if(film.urlImage.contains('w185null')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://www.farmingtonlibraries.org/sites/default/files/2021-07/Movie%20Night.png',
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        film.urlImage,
      ),
    );
  }
}
