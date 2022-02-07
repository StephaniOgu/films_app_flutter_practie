import 'package:films_app_practie/presentation/themes/theme.dart';
import 'package:films_app_practie/router_delegate.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const FilmsApp());
}

class FilmsApp extends StatefulWidget {
  const FilmsApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FilmsAppState();
  }
}

class _FilmsAppState extends State<FilmsApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FilmsAppTheme.lightTheme,
      darkTheme: FilmsAppTheme.darkTheme,
      home: Router(
        backButtonDispatcher: RootBackButtonDispatcher(),
        routerDelegate: AppRouterDelegate(),
      ), // _buildBlocProvider(),
    );
  }
}