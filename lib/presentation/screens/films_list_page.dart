import 'package:films_app_practie/domain/films_list/cubit/films_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//WIP: working in production
//this screen will be changed

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Movies'),
      ),
      body: BlocBuilder<FilmsListCubit, FilmsListBaseState>(
        builder: (context, state) {
          if (state is LoadingFilmsListState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorFilmsListState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is LoadedFilmsListState) {
            final movies = state.films;

            return ListView.builder(
              itemCount: movies!.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(movies[index].title),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(movies[index].urlImage),
                  ),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
