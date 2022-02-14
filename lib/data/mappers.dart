import 'package:films_app_practie/data/models/actor.dart';
import 'package:films_app_practie/data/models/film_staff_member.dart';
import 'package:films_app_practie/presentation/models/actor.dart';
import 'package:films_app_practie/presentation/models/film_staff_member.dart';
import '../presentation/models/film.dart';
import 'models/film.dart';

FilmUIModel mapFilmDataModelToUI(FilmDataModel filmDataModel) {
  var urlImage = filmDataModel.urlImage.contains('null')
      ? 'https://www.farmingtonlibraries.org/sites/default/files/2021-07/Movie%20Night.png'
      : 'https://image.tmdb.org/t/p/w185${filmDataModel.urlImage}';

  return FilmUIModel(
      id: filmDataModel.id,
      title: filmDataModel.title,
      overview: filmDataModel.overview,
      usersFeedback: filmDataModel.usersFeedback,
      releaseDate: filmDataModel.releaseDate,
      urlImage: urlImage);
}

ActorUIModel mapDataActorToUI(ActorDataModel actorDataModel) {
  var gender = actorDataModel.gender == '1'
      ? 'Female'
      : actorDataModel.gender == '2'
          ? 'Male'
          : 'n/a';
  var urlImage = actorDataModel.urlImage.contains('null') && actorDataModel.gender == '1'
      ? 'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg'
      : actorDataModel.urlImage.contains('null')
          ? 'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg'
          : 'https://image.tmdb.org/t/p/w185${actorDataModel.urlImage}';
  return ActorUIModel(
    name: actorDataModel.name,
    about: actorDataModel.about,
    gender: gender,
    placeOfBirth: actorDataModel.placeOfBirth,
    urlImage: urlImage,
  );
}

FilmStaffMemberUIModel _mapDataFilmStaffMemberToUI(
    FilmStaffMemberDataModel filmStaffMemberDataModel) {
  var urlImage = filmStaffMemberDataModel.urlImage.contains('null') &&
          filmStaffMemberDataModel.gender == '1'
      ? 'https://t3.ftcdn.net/jpg/01/81/15/58/240_F_181155874_1SysdscU5EWcCri5ZTe97bhz1PCdQE7H.jpg'
      : filmStaffMemberDataModel.urlImage.contains('null')
          ? 'https://www.meme-arsenal.com/memes/dc69087c94cb6ec44f899407d77a2839.jpg'
          : 'https://image.tmdb.org/t/p/w185${filmStaffMemberDataModel.urlImage}';

  return FilmStaffMemberUIModel(
    id: filmStaffMemberDataModel.id,
    name: filmStaffMemberDataModel.name,
    character: filmStaffMemberDataModel.character,
    urlImage: urlImage,
  );
}

List<FilmStaffMemberUIModel> mapDataFilmStaffMemberListToUI(
    List<FilmStaffMemberDataModel> actorsDataModelList) {
  List<FilmStaffMemberUIModel> actorsUIModelList = [];

  if (actorsDataModelList.isNotEmpty) {
    for (int i = 0; i < actorsDataModelList.length; ++i) {
      actorsUIModelList
          .add(_mapDataFilmStaffMemberToUI(actorsDataModelList[i]));
    }
    return actorsUIModelList;
  }
  return List.empty();
}
