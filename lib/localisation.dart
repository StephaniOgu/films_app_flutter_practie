import 'dart:async';
import 'package:flutter/material.dart';

class FilmsLocalizations {

  static FilmsLocalizations? of(BuildContext context) {
    return Localizations.of<FilmsLocalizations>(
      context,
      FilmsLocalizations,
    );
  }

  String get filmListScreenTitle => 'Now Popular';
  String get searchTitle => 'Search';

  String get filmDetailsUF => 'Users feedback';
  String get filmDetailsYear => 'Year';
  String get filmDetailsLength => 'Length';
  String get filmDetailsOverview => 'Overview';

  String get actorDetailsGender => 'Gender';
  String get actorDetailsBirthday => 'Birthday';
  String get actorDetailsPlace => 'Place';
  String get actorDetailsAbout => 'About';

  String get seeMoreBtnText => 'See more';
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