import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/models/film_staff_member.dart';
import 'package:films_app_practie/presentation/models/actor.dart';
import 'package:films_app_practie/presentation/models/film_staff_member.dart';
import '../presentation/models/film.dart';
import 'models/film.dart';



FilmUIModel mapFilmDataModelToUI(FilmDataModel filmDataModel) {
  return FilmUIModel(
    id: filmDataModel.id,
    title: filmDataModel.title,
    overview: filmDataModel.overview,
    usersFeedback: filmDataModel.usersFeedback,
    releaseDate: filmDataModel.releaseDate,
    urlImage: filmDataModel.urlImage.contains('null')
        ? 'https://www.farmingtonlibraries.org/sites/default/files/2021-07/Movie%20Night.png'
        : 'https://image.tmdb.org/t/p/w185${filmDataModel.urlImage}',
  );
}

ActorUIModel mapDataActorToUI(ActorDataModel actorDataModel) {
  return ActorUIModel(
    name: actorDataModel.name,
    about: actorDataModel.about,
    gender: actorDataModel.gender == '1'
        ? 'Female'
        : actorDataModel.gender == '2'
            ? 'Male'
            : 'n/a',
    placeOfBirth: actorDataModel.placeOfBirth,
    urlImage: actorDataModel.urlImage.contains('null') &&
            actorDataModel.gender == '1'
        ? 'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg'
        : actorDataModel.urlImage.contains('null')
            ? 'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg'
            : 'https://image.tmdb.org/t/p/w185${actorDataModel.urlImage}',
  );
}

FilmStaffMemberUIModel _mapDataFilmStaffMemberToUI(
    FilmStaffMemberDataModel filmStaffMemberDataModel) {
  return FilmStaffMemberUIModel(
    id: filmStaffMemberDataModel.id,
    name: filmStaffMemberDataModel.name,
    character: filmStaffMemberDataModel.character,
    urlImage: filmStaffMemberDataModel.urlImage.contains('null') &&
            filmStaffMemberDataModel.gender == '1'
        ? 'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg'
        : filmStaffMemberDataModel.urlImage.contains('null')
            ? 'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg'
            : 'https://image.tmdb.org/t/p/w185${filmStaffMemberDataModel.urlImage}',
  );
}

List<FilmStaffMemberUIModel> mapDataFilmStaffMemberListToUI(
    List<FilmStaffMemberDataModel> actorsDataModelList) {
  return actorsDataModelList.map(_mapDataFilmStaffMemberToUI).toList();
}
