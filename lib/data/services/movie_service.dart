import 'package:dio/dio.dart';
import 'package:movie_ticket/core/constants/api_endpoints.dart';
import 'package:movie_ticket/data/models/movie_model.dart';

class MovieService {
  final Dio _dio;

  MovieService(String v4Token)
      : _dio = Dio(BaseOptions(
    baseUrl: ApiEndPoints.baseUrl,
    headers: {
      'Authorization': 'Bearer $v4Token',
      'Content-Type': 'application/json;charset=utf-8',
    },
    responseType: ResponseType.json,
  ));

  Future<List<MovieModel>> getPopularMovies() async {
    try {
      final response = await _dio.get(ApiEndPoints.popularMovies);
      final data = response.data;

      if (data is Map<String, dynamic>) {
        final results = data['results'];
        if (results is List) {
          return results
              .whereType<Map<String, dynamic>>() // only keep maps
              .map((json) => MovieModel.fromJson(json))
              .toList();
        }
      }
      throw Exception('Invalid response format for popular movies');
    } catch (e) {
      throw Exception('Failed to load popular movies: $e');
    }
  }

  Future<MovieModel> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get('${ApiEndPoints.movieDetails}$movieId');
      final data = response.data;

      if (data is Map<String, dynamic>) {
        return MovieModel.fromJson(data);
      }
      throw Exception('Invalid response format for movie details');
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        ApiEndPoints.searchMovies,
        queryParameters: {'query': query},
      );
      final data = response.data;

      if (data is Map<String, dynamic>) {
        final results = data['results'];
        if (results is List) {
          return results
              .whereType<Map<String, dynamic>>() // only keep maps
              .map((json) => MovieModel.fromJson(json))
              .toList();
        }
      }
      throw Exception('Invalid response format for search movies');
    } catch (e) {
      throw Exception('Failed to search movies: $e');
    }
  }
}