class ValuesRepository {
  //   domainName get parameter API_DOMAIN from sys env var [flutterPracticeFilmsApi]
  //   Expected value: 'https://api.themoviedb.org/3';
   static String get domainName => const String.fromEnvironment('API_DOMAIN');

  //   apiKey get parameter API_KEY from sys env var [flutterPracticeFilmsKey]
  //   Expected value: 'd4042a814f7ec085951eebff4536a5c6';
   static String get apiKey => const String.fromEnvironment('API_KEY');
}
