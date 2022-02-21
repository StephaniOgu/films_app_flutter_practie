import 'package:dio/dio.dart';
import 'package:films_app_practie/data/repositories/actors_repository.dart';
import 'package:films_app_practie/data/repositories/films_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

//command for testing:
// flutter test --dart-define API_KEY=%flutterPracticeFilmsKey% --dart-define API_DOMAIN=%flutterPracticeFilmsApi% test/data/repositories/repositories_test.dart

main() {
  GetIt.I.registerSingleton<Dio>(Dio());
  final client = GetIt.I<Dio>();

  group('Correct of actorsRepository logic', () {
    ActorsRepository actorsRepository = ActorsRepository(client: client);

    test('All staff members are actors', () async {
      var filmStaffMemberDataModelList =
          await actorsRepository.getActorsListByFilm(filmId: '632727');
      expect(
          filmStaffMemberDataModelList
              .every((staffMember) => staffMember.position == 'Acting'),
          true);
    });

    test('get Actor Info', () async {
      var actorDataModel = await actorsRepository.getActorInfo('100');
      expect(actorDataModel.id, '100');
    });
  });

  group('Correct of filmsRepository logic', () {
    FilmsRepository filmsRepository = FilmsRepository(client: client);

    test('All films contains query results', () async {
      var query = 'Harry';
      var filmStaffMemberDataModelList =
          await filmsRepository.getFilms(page: 1, searchQuery: query);
      expect(
          filmStaffMemberDataModelList.every((film) =>
              film.title.contains(query) || film.overview.contains(query)),
          true);
    });
  });
}
