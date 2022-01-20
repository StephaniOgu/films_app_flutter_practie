import 'dart:async';
import 'package:flutter/material.dart';

class FilmsLocalizations {

  static FilmsLocalizations? of(BuildContext context) {
    return Localizations.of<FilmsLocalizations>(
      context,
      FilmsLocalizations,
    );
  }

  String get appTitle => "Films App";
  //TODO: Add the screens names;
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
      locale.languageCode.toLowerCase().contains("en");
}