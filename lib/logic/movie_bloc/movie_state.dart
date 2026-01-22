import 'package:equatable/equatable.dart';
import 'package:movie_ticket/data/models/movie_model.dart';

abstract class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MoviesLoaded extends MovieState {
  final List<MovieModel> movies;

  MoviesLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieDetailLoaded extends MovieState {
  final MovieModel movie;

  MovieDetailLoaded(this.movie);

  @override
  List<Object?> get props => [movie];
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}
