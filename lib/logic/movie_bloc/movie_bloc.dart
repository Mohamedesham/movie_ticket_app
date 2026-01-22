import 'package:bloc/bloc.dart';
import 'package:movie_ticket/data/repositories/movie_repository.dart';
import 'package:movie_ticket/logic/movie_bloc/movie_event.dart';
import 'package:movie_ticket/logic/movie_bloc/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository movieRepository;

  MovieBloc(this.movieRepository) : super(MovieInitial()) {
    on<FetchPopularMovies>(_onFetchPopularMovies);
    on<FetchMovieDetails>(_onFetchMovieDetails);
    on<SearchMovies>(_onSearchMovies);
  }

  Future<void> _onFetchPopularMovies(FetchPopularMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await movieRepository.getPopularMovies();
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onFetchMovieDetails(FetchMovieDetails event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movie = await movieRepository.getMovieDetails(event.movieId);
      emit(MovieDetailLoaded(movie));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }

  Future<void> _onSearchMovies(SearchMovies event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await movieRepository.searchMovies(event.query);
      emit(MoviesLoaded(movies));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
}
