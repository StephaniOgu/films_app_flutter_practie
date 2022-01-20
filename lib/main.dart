import 'package:films_app_practie/theme.dart';
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
      home: Scaffold(
        appBar: AppBar(
          actions: _buildActions(),
        ),
        body: Center(
          child: ElevatedButton(onPressed: () {  }, child: null,),
        ),
      ),
    );
  }
}

List<Widget> _buildActions() {
  return <Widget>[
    IconButton(
      icon: const Icon(Icons.search),
      onPressed: () {},
    ),
  ];
}
