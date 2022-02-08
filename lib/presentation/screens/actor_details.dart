import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/domain/actor/cubit/actors_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../localisation.dart';

class ActorDetailsPage extends StatefulWidget {
  const ActorDetailsPage({Key? key}) : super(key: key);

  @override
  _ActorDetailsPageState createState() => _ActorDetailsPageState();
}

class _ActorDetailsPageState extends State<ActorDetailsPage> {
  late Actor _actor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBlocConsumer(),
    );
  }

  BlocConsumer<ActorDetailsCubit, ActorDetailsBaseState> _buildBlocConsumer() {
    return BlocConsumer<ActorDetailsCubit, ActorDetailsBaseState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadingActorDetailsState) {
          _buildLoadingScreen();
        } else if (state is ErrorActorDetailsState) {
          return _buildErrorScreen(state);
        } else if (state is LoadedActorDetailsState) {
          _actor = state.actor;
          return _buildLoadedScreen();
        }
        return Container();
      },
    );
  }

  Widget _buildLoadingScreen() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorScreen(ErrorActorDetailsState state) {
    return Center(
        child: Text(
      FilmsLocalizations.errorTitle,
      style: Theme.of(context).textTheme.bodyText1,
    ));
  }

  Widget _buildLoadedScreen() {
    return SafeArea(
        left: true,
        top: false,
        minimum: const EdgeInsets.only(left: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.network(
                _actor.urlImage,
                height: 300,
              ),
            ),
            Text(
              _actor.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            _buildInfo('Name: ${_actor.name}'),
            _buildInfo('Gender: ${_actor.gender}'),
            if(_actor.placeOfBirth!=null) _buildInfo('Place of birth: ${_actor.placeOfBirth}'),
            if(_actor.about!='') _buildAboutTitle(),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _actor.about!,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Row _buildAboutTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 8, top: 16),
          child: Text(
            'About',
            style: Theme.of(context).textTheme.headline2,
          ),
        )
      ],
    );
  }

  Widget _buildInfo(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.left,
            ),
          )
        ],
      ),
    );
  }
}
