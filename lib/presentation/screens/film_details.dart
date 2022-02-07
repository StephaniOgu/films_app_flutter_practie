import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/domain/film/cubit/film_details_cubit.dart';
import 'package:films_app_practie/presentation/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../localisation.dart';

class FilmsDetailsPage extends StatefulWidget {
  const FilmsDetailsPage({Key? key, required this.onActorTap})
      : super(key: key);

  final void Function(FilmStaffMember actor) onActorTap;

  @override
  _FilmsDetailsPageState createState() => _FilmsDetailsPageState();
}

class _FilmsDetailsPageState extends State<FilmsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBlocConsumer(),
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
          return _buildLoadedScreen(state.film, state.actorList!);
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
    ));
  }

  Widget _buildLoadedScreen(Film film, List <FilmStaffMember> actors) {

    return Center(
      child: Text('${film.title}\n${actors[0]}'),
    );
  }
}
