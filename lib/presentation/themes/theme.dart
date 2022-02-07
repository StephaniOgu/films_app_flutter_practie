import 'package:films_app_practie/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class FilmsAppTheme {
  static ThemeData get darkTheme {
    final _themeData = ThemeData.dark();
    final _textTheme = _themeData.textTheme;

    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.depthBlue,
      appBarTheme: _appBarTheme(
          appBarColor: AppColors.turquoise, textColor: AppColors.middleBlue),
      canvasColor: AppColors.surfaceBlue,
      floatingActionButtonTheme:
          _floatingActionButtonThemeData(AppColors.turquoise),
      elevatedButtonTheme: _elevatedButtonThemeData(),
      cardTheme: _cardTheme(cardColor: AppColors.deepBlue),
      splashColor: AppColors.turquoise,
      textTheme: _textTheme.copyWith(
        headline1: _textStyle(AppColors.snowWhite, 24),
        headline2: _textStyle(AppColors.snowWhite, 18),
        headline3: _textStyle(AppColors.headline3Dark, 16),
        headline4: _textStyle(AppColors.headline4Dark, 24),
        headline5: _textStyle(AppColors.paleGreenWhite, 18),
        headline6: _textStyle(AppColors.fluffyWhite, 18),
        subtitle1: _textStyle(AppColors.sunYellow, 18),
        subtitle2: _textStyle(AppColors.subtitle2Dark, 14),
        bodyText1: _textStyle(AppColors.bodyText1Dark, 18),
        bodyText2: _textStyle(AppColors.sunYellow, 24),
      ),
    );
  }

  static ThemeData get lightTheme {
    final _themeData = ThemeData.light();
    final _textTheme = _themeData.textTheme;

    return ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.shellWhite,
        appBarTheme: _appBarTheme(
            appBarColor: AppColors.sunYellow, textColor: AppColors.lightGray),
        canvasColor: AppColors.fluffyWhite,
        floatingActionButtonTheme:
            _floatingActionButtonThemeData(AppColors.turquoise),
        elevatedButtonTheme: _elevatedButtonThemeData(),
        cardTheme: _cardTheme(cardColor: AppColors.white),
        splashColor: AppColors.sunYellow,
        textTheme: _textTheme.copyWith(
          headline1: _textStyle(AppColors.lightGray, 24),
          headline2: _textStyle(AppColors.lightGray, 18),
          headline3: _textStyle(AppColors.lightGray, 16),
          headline4: _textStyle(AppColors.headline4Light, 24),
          headline5: _textStyle(AppColors.sunYellow, 18),
          headline6: _textStyle(AppColors.fluffyWhite, 18),
          subtitle1: _textStyle(AppColors.sunYellow, 18),
          subtitle2: _textStyle(AppColors.bodyText1Light, 14),
          bodyText1: _textStyle(AppColors.bodyText1Light, 18),
          bodyText2: _textStyle(AppColors.sunYellow, 24),
        ));
  }

  static CardTheme _cardTheme({required Color cardColor}) {
    return CardTheme(
      color: cardColor,
      margin: const EdgeInsets.all(10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  static AppBarTheme _appBarTheme(
      {required Color appBarColor, required Color textColor}) {
    return AppBarTheme(
      color: appBarColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(70),
        ),
      ),
      actionsIconTheme: IconThemeData(
        size: 100,
        color: textColor,
      ),
    );
  }

  static FloatingActionButtonThemeData _floatingActionButtonThemeData(
      Color color) {
    return FloatingActionButtonThemeData(
      backgroundColor: color,
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: AppColors.sunYellow,
        onPrimary: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  static TextStyle _textStyle(Color color, double textSize) {
    return TextStyle(
      fontFamily: 'Quicksand',
      fontWeight: FontWeight.bold,
      color: color,
      fontSize: textSize,
    );
  }
}
