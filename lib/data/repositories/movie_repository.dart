import 'package:movie_ticket/data/models/movie_model.dart';
import 'package:movie_ticket/data/services/movie_service.dart';

class MovieRepository {
  final MovieService _movieService;

  MovieRepository(this._movieService);

  Future<List<MovieModel>> getPopularMovies() =>
      _movieService.getPopularMovies();

  Future<MovieModel> getMovieDetails(int movieId) =>
      _movieService.getMovieDetails(movieId);

  Future<List<MovieModel>> searchMovies(String query) =>
      _movieService.searchMovies(query);
}
