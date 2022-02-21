import 'dart:async';
import 'package:flutter/material.dart';

class FilmsLocalizations {

  static FilmsLocalizations? of(BuildContext context) {
    return Localizations.of<FilmsLocalizations>(
      context,
      FilmsLocalizations,
    );
  }
  static String get errorTitle => 'Sorry, something went wrong :(';
  static String get noResults => 'No such results';

  static String get filmListScreenTitle => '';
  static String get filmListScreenHintText => 'Search film';

  static String get filmListScreenLabel => 'Now Popular';
  static String get searchTitle => 'Search';

  static String get filmDetailsUF => 'Users feedback';
  static String get filmDetailsYear => 'Year';
  static String get filmDetailsLength => 'Length';
  static String get filmDetailsOverview => 'Overview';

  static String get actorDetailsGender => 'Gender';
  static String get actorDetailsBirthday => 'Birthday';
  static String get actorDetailsPlace => 'Place';
  static String get actorDetailsAbout => 'About';

  static String get seeMoreBtnText => 'See more';

  static String get usersFeedback => 'Users feedback:';
  static String get actorsSubtitle => 'Actors';
  static String get overview => 'Overview';

}

class FlutterBlocLocalizationsDelegate
    extends LocalizationsDelegate<FilmsLocalizations> {
  @override
  Future<FilmsLocalizations> load(Locale locale) =>
      Future(() => FilmsLocalizations());

  @override
  bool shouldReload(FlutterBlocLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains('en');
}