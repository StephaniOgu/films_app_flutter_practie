import 'package:films_app_practie/data/mappers.dart';
import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/models/film.dart';
import 'package:films_app_practie/data/models/film_staff_member.dart';
import 'package:films_app_practie/presentation/models/actor.dart';
import 'package:films_app_practie/presentation/models/film.dart';
import 'package:films_app_practie/presentation/models/film_staff_member.dart';
import 'package:flutter_test/flutter_test.dart';

//command for testing: flutter test test/data/mappers_test.dart

//Нормально ли, что я делаю копирование? В документации написано, что нужно
// избавиться от зависимости между тестами

void main() {
  late FilmUIModel filmUIModel;
  late ActorUIModel actorUIModel;
  late FilmStaffMemberUIModel filmStaffMemberUIModel;

  FilmDataModel filmDataModel = const FilmDataModel(
    id: '1',
    title: 'Film',
    releaseDate: '01-01-01',
    overview: 'Overview',
    usersFeedback: '80',
    urlImage: 'urlImage',
  );
  ActorDataModel actorDataModel = const ActorDataModel(
    id: '1',
    name: 'Name',
    gender: '1',
    about: 'About',
    placeOfBirth: 'PlaceOfBirth',
    urlImage: 'urlImage',
  );
  FilmStaffMemberDataModel filmStaffMemberDataModel =
      const FilmStaffMemberDataModel(
          id: '1',
          name: 'Name',
          gender: '1',
          character: 'Character',
          urlImage: 'urlImage',
          position: 'Acting');

  group('Mappers', () {
    test('map FilmDataModel to FilmUIModel with the urlImage', () {
      filmUIModel = FilmUIModel(
        id: '1',
        title: 'Film',
        releaseDate: '01-01-01',
        overview: 'Overview',
        usersFeedback: '80',
        urlImage: 'https://image.tmdb.org/t/p/w185${filmDataModel.urlImage}',
      );
      expect(mapFilmDataModelToUI(filmDataModel), filmUIModel);
    });

    test('map FilmDataModel to FilmUIModel without the urlImage', () {
      filmDataModel.copyWith(urlImage: 'null');
      filmUIModel.copyWith(
          urlImage:
              'https://www.farmingtonlibraries.org/sites/default/files/2021-07/Movie%20Night.png');
      expect(mapFilmDataModelToUI(filmDataModel), filmUIModel);
    });

    test('map ActorDataModel to ActorUIModel female with the urlImage', () {
      actorUIModel = ActorUIModel(
        name: 'Name',
        gender: 'Female',
        about: 'About',
        placeOfBirth: 'PlaceOfBirth',
        urlImage: 'https://image.tmdb.org/t/p/w185${actorDataModel.urlImage}',
      );

      expect(mapActorDataModelToUI(actorDataModel), actorUIModel);
    });

    test('map ActorDataModel to ActorUIModel female without the urlImage', () {
      actorDataModel = actorDataModel.copyWith(urlImage: 'null');
      actorUIModel = actorUIModel.copyWith(
          urlImage:
              'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg');

      expect(mapActorDataModelToUI(actorDataModel), actorUIModel);
    });

    test('map ActorDataModel to ActorUIModel male without the urlImage', () {
      actorDataModel = actorDataModel.copyWith(gender: '2');
      actorUIModel = actorUIModel.copyWith(
          gender: 'Male',
          urlImage:
              'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg');

      expect(mapActorDataModelToUI(actorDataModel), actorUIModel);
    });

    test('map ActorDataModel to ActorUIModel male with the urlImage', () {
      actorDataModel = actorDataModel.copyWith(urlImage: 'urlImage');
      actorUIModel = actorUIModel.copyWith(
          urlImage: 'https://image.tmdb.org/t/p/w185${filmDataModel.urlImage}');

      expect(mapActorDataModelToUI(actorDataModel), actorUIModel);
    });

    test('map ActorDataModel to ActorUIModel non gender without the urlImage',
        () {
      actorDataModel = actorDataModel.copyWith(urlImage: 'null', gender: '3');
      actorUIModel = actorUIModel.copyWith(
          gender: 'n/a',
          urlImage:
              'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg');

      expect(mapActorDataModelToUI(actorDataModel), actorUIModel);
    });

    test('map ActorDataModel to ActorUIModel non gender with the urlImage', () {
      actorDataModel = actorDataModel.copyWith(urlImage: 'urlImage');
      actorUIModel = actorUIModel.copyWith(
          urlImage: 'https://image.tmdb.org/t/p/w185${filmDataModel.urlImage}');

      expect(mapActorDataModelToUI(actorDataModel), actorUIModel);
    });

    test('map FilmStaffMemberDataModel to FilmStaffMemberUIModel with the url',
        () {
      filmStaffMemberUIModel = FilmStaffMemberUIModel(
        id: '1',
        name: 'Name',
        character: 'Character',
        urlImage:
            'https://image.tmdb.org/t/p/w185${filmStaffMemberDataModel.urlImage}',
      );
      expect(mapFilmStaffMemberDataModelToUI(filmStaffMemberDataModel),
          filmStaffMemberUIModel);
    });

    test(
        'map female FilmStaffMemberDataModel to FilmStaffMemberUIModel without the url',
        () {
      filmStaffMemberDataModel =
          filmStaffMemberDataModel.copyWith(gender: '1', urlImage: 'null');
      filmStaffMemberUIModel = filmStaffMemberUIModel.copyWith(
          urlImage:
              'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg');
      expect(mapFilmStaffMemberDataModelToUI(filmStaffMemberDataModel),
          filmStaffMemberUIModel);
    });

    test(
        'map male FilmStaffMemberDataModel to FilmStaffMemberUIModel without the url',
        () {
      filmStaffMemberDataModel = filmStaffMemberDataModel.copyWith(gender: '2');
      filmStaffMemberUIModel = filmStaffMemberUIModel.copyWith(
          urlImage:
              'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg');
      expect(mapFilmStaffMemberDataModelToUI(filmStaffMemberDataModel),
          filmStaffMemberUIModel);
    });

    test(
        'map unexpected gender FilmStaffMemberDataModel to FilmStaffMemberUIModel without the url',
        () {
      filmStaffMemberDataModel = filmStaffMemberDataModel.copyWith(gender: '3');
      filmStaffMemberUIModel = filmStaffMemberUIModel.copyWith(
          urlImage:
              'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg');
      expect(mapFilmStaffMemberDataModelToUI(filmStaffMemberDataModel),
          filmStaffMemberUIModel);
    });

    test(
        'map FilmStaffMemberDataModel empty List to FilmStaffMemberUIModel List',
        () {
      List<FilmStaffMemberDataModel> filmStaffMemberDataModelList = [];
      expect(mapFilmStaffMemberDataListToUI(filmStaffMemberDataModelList),
          List.empty());
    });

    test('map FilmStaffMemberDataModel List to FilmStaffMemberUIModel List',
        () {
      expect(
          mapFilmStaffMemberDataListToUI(
              <FilmStaffMemberDataModel>[filmStaffMemberDataModel]),
          <FilmStaffMemberUIModel>[filmStaffMemberUIModel]);
    });
  });
}
