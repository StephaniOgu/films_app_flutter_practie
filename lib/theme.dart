import 'package:flutter/material.dart';

class FilmsAppTheme {
  static ThemeData get darkTheme {
    final _themeData = ThemeData.dark();
    final _textTheme = _themeData.textTheme;

    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(22, 22, 33, 1),
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(40, 146, 126, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(70),
          ),
        ),
        actionsIconTheme: IconThemeData(
          size: 100,
          color: Color.fromRGBO(51, 51, 73, 1),
        ),
      ),
      canvasColor: const Color.fromRGBO(51, 51, 73, 1),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(40, 146, 126, 1),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(250, 194, 46, 1),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),

      textTheme: _textTheme.copyWith(
        headline1: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(238, 250, 252, 1),
          fontSize: 24,
        ),
        headline2: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(238, 250, 252, 1),
          fontSize: 18,
        ),
        headline3: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(224, 231, 234, 1),
          fontSize: 18,
        ),
        headline4: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 24,
        ),
        subtitle1: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(250, 194, 46, 1),
          fontSize: 18,
        ),
        subtitle2: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(198, 198, 200, 1),
          fontSize: 14,
        ),
        bodyText1: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(198, 198, 200, 1),
          fontSize: 18,
        ),
        bodyText2: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(250, 194, 46, 1),
          fontSize: 24,
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    final _themeData = ThemeData.light();
    final _textTheme = _themeData.textTheme;

    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(250, 194, 46, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(70),
          ),
        ),
        actionsIconTheme: IconThemeData(
          size: 100,
          color: Color.fromRGBO(75, 74, 78, 1),
        ),
      ),
      canvasColor: const Color.fromRGBO(251, 251, 253, 1),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromRGBO(40, 146, 126, 1),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromRGBO(250, 194, 46, 1),
          onPrimary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),

      textTheme: _textTheme.copyWith(
        headline1: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(75, 74, 78, 1),
          fontSize: 24,
        ),
        headline2: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(75, 74, 78, 1),
          fontSize: 18,
        ),
        headline3: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(75, 74, 78, 1),
          fontSize: 18,
        ),
        headline4: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 24,
        ),
        subtitle1: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(250, 194, 46, 1),
          fontSize: 18,
        ),
        subtitle2: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(198, 198, 200, 1),
          fontSize: 14,
        ),
        bodyText1: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(124, 123, 126, 1),
          fontSize: 18,
        ),
        bodyText2: const TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(250, 194, 46, 1),
          fontSize: 24,
        ),
      ),
    );
  }
}
