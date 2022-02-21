import 'dart:ui';

import 'package:films_app_practie/presentation/models/film_staff_member.dart';
import 'package:films_app_practie/presentation/screens/film_details/cubit/film_details_cubit.dart';
import 'package:films_app_practie/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../localisation.dart';
import '../../models/film.dart';

class FilmsDetailsPage extends StatefulWidget {
  const FilmsDetailsPage({Key? key, required this.onActorTap})
      : super(key: key);

  final void Function(FilmStaffMemberUIModel actor) onActorTap;

  @override
  _FilmsDetailsPageState createState() => _FilmsDetailsPageState();
}

class _FilmsDetailsPageState extends State<FilmsDetailsPage> {
  late FilmUIModel _film;
  late List<FilmStaffMemberUIModel>? _actors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBlocConsumer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          String url =
              'https://www.youtube.com/results?search_query=${_film.title.replaceAll(' ', '_')}';
          context.read<FilmDetailsCubit>().launchURL(url: url);
        },
      ),
    );
  }

  BlocConsumer<FilmDetailsCubit, FilmDetailsBaseState> _buildBlocConsumer() {
    return BlocConsumer<FilmDetailsCubit, FilmDetailsBaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingFilmDetailsState) {
          buildLoadingScreen();
        } else if (state is ErrorFilmDetailsState) {
          return _buildErrorScreen(state);
        } else if (state is LoadedFilmDetailsState) {
          _film = state.film;
          _actors = state.actorList!;
          return _buildLoadedScreen();
        }
        return Container();
      },
    );
  }

  Widget _buildErrorScreen(ErrorFilmDetailsState state) {
    return Center(
      child: Text(
        FilmsLocalizations.errorTitle,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _buildLoadedScreen() {
    return SafeArea(
        bottom: false,
        top: false,
        minimum: const EdgeInsets.only(left: 8, right: 16),
        child: Column(
          children: [
            _buildFilmImage(),
            _buildScreenTitle(),
            _buildFilmDetails(),
            _buildActorsList(),
          ],
        ));
  }

  Widget _buildFilmImage() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        _buildBcImage(),
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Image(
            image: NetworkImage(_film.urlImage),
            height: 300,
          ),
        ),
      ],
    );
  }

  Widget _buildBcImage() {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
      child: AspectRatio(
        aspectRatio: 8 / 5,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.topCenter,
              image: NetworkImage(_film.urlImage),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScreenTitle() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          _film.title,
          style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Row _buildFilmDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFilmInfo(),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            '${_film.usersFeedback}%',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        )
      ],
    );
  }

  Widget _buildFilmInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Text(
            FilmsLocalizations.usersFeedback,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 8),
          child: Text(
            'Year: \t ${_film.releaseDate}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ],
    );
  }

  Widget _buildActorsList() {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 4),
        itemCount: _actors!.length + 3,
        itemBuilder: (context, index) => _buildActorItem(index),
      ),
    );
  }

  Widget _buildActorItem(int index) {
    var actorIndex = index - 3;

    if (index == 0) {
      return _buildLabel(FilmsLocalizations.overview);
    } else if (index == 1) {
      return _buildFilmOverview();
    } else if (index == 2 && _actors!.isNotEmpty) {
      return _buildLabel(FilmsLocalizations.actorsSubtitle);
    } else if (index == 2 && _actors!.isEmpty) {
      return const SizedBox();
    } else {
      return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(_actors![actorIndex].urlImage),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  '${_actors![actorIndex].name} (${_actors![actorIndex].character})',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          widget.onActorTap(_actors![actorIndex]);
        },
      );
    }
  }

  Widget _buildLabel(String label) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }

  Widget _buildFilmOverview() {
    return Expanded(
      child: Text(
        _film.overview,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
