class ApiEndPoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = String.fromEnvironment('TMDB_API_KEY');

  static const String popularMovies = '/movie/popular';
  static const String movieDetails = '/movie/';
  static const String searchMovies = '/search/movie';
  static const String genres = '/genre/movie/list';
}
