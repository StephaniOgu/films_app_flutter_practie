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
  late int _pageNumber;
  late String? _query;
  late bool _isLast;

  late List<Widget> _filmsListNavigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _buildBigSizedBox(),
          _buildSearchField(),
          _buildBigSizedBox(),
        ],
      ),
      body: _buildBlocConsumer(),
    );
  }

  Widget _buildBigSizedBox() {
    return const SizedBox(
      height: 10,
      width: 100,
    );
  }

  Widget _buildSearchField() {
    return Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.headline6,
        decoration: InputDecoration(
          icon: const Icon(Icons.search),
          hintText: FilmsLocalizations.filmListScreenHintText,
          hintStyle: Theme.of(context).textTheme.headline5,
        ),
        onSubmitted: (query) async {
          context
              .read<FilmsListCubit>()
              .searchFilms(page: 1, query: query);
        },
      ),
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
          _isLast = state.isLast;
          _query = state.query;
          _pageNumber = state.page;
          _filmsListNavigation = _getNavigation();
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
        ),
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
      itemCount: movies.length + 1,
      itemBuilder: (context, index) => _buildFilmItem(movies, index),
    );
  }

  Widget _buildFilmItem(List<Film> films, int index) {
    if (index < films.length) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            _buildFilmCard(films[index]),
            _buildFilmImage(films[index]),
          ],
        ),
      );
    } else {
      return _buildFilmsListNavigation();
    }
  }

  Widget _buildFilmCard(Film film) {
    return SizedBox(
      height: 135,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBigSizedBox(),
            _buildFilmInfo(film),
            _buildFilmRating(film),
          ],
        ),
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
    if (film.urlImage.contains('w185null')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://www.farmingtonlibraries.org/sites/default/files/2021-07/Movie%20Night.png',
          height: 150,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        film.urlImage,
        height: 150,
      ),
    );
  }

  Widget _buildFilmsListNavigation() {
    List<Widget> rowContaining = _filmsListNavigation;
    if (_pageNumber == 1) {
      rowContaining[0] = const SizedBox(width: 60);
    } if (_isLast == true) {
      rowContaining[rowContaining.length -1] = const SizedBox(width: 60);
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rowContaining,
    );
  }

  _buildPreviewPageBtn() {
    return IconButton(
      icon: const Icon(Icons.navigate_before),
      color: Theme.of(context).splashColor,
      onPressed: () {
        context.read<FilmsListCubit>().searchFilms(page: _pageNumber - 1, query: _query);
      },
    );
  }

  Widget _buildPageNumber() {
    return BlocConsumer<FilmsListCubit, FilmsListBaseState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                alignment: Alignment.center,
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                    color: Theme.of(context).splashColor,
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Text(
                  '$_pageNumber',
                  style: Theme.of(context).textTheme.headline2,
                )),
          );
        });
  }

  _buildNextPageBtn() {
    return IconButton(
      icon: const Icon(Icons.navigate_next),
      color: Theme.of(context).splashColor,
      onPressed: () {
        context.read<FilmsListCubit>().searchFilms(page: _pageNumber + 1, query: _query);
      },
    );
  }

  List<Widget> _getNavigation(){
    return [
      _buildPreviewPageBtn(),
      _buildPageNumber(),
      _buildNextPageBtn(),
    ];
  }
}
