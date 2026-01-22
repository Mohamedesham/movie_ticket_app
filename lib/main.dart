import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/logic/movie_bloc/movie_bloc.dart';
import 'package:movie_ticket/logic/cinema_bloc/cinema_bloc.dart';
import 'package:movie_ticket/data/repositories/movie_repository.dart';
import 'package:movie_ticket/data/repositories/cinema_repository.dart';
import 'package:movie_ticket/presentation/screens/main_screen.dart';
import 'core/constants/colors.dart';
import 'data/services/cinema_services.dart';
import 'data/services/movie_service.dart';
import 'logic/cinema_bloc/cinema_event.dart';
import 'logic/movie_bloc/movie_event.dart';

void main() {
  final dio = Dio();
  const v4Token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMDcxNDI2OTI3MTc4MjkzMWVkNDJjMTBhOGNjNDNmNCIsIm5iZiI6MTc2MzEwNjIxNC45NjUsInN1YiI6IjY5MTZkZGE2ZmNhOWEyOTQyYTlhZDhjOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._taSGJOxF7WATAKUMZH3XcpEWooTZ_gWJinivc4jFj4';

  // Services
  final movieService = MovieService(v4Token);
  final cinemaService = CinemaService();

  // Repositories
  final movieRepository = MovieRepository(movieService);
  final cinemaRepository = CinemaRepository(cinemaService);

  runApp(
    MyApp(movieRepository: movieRepository, cinemaRepository: cinemaRepository),
  );
}

class MyApp extends StatelessWidget {
  final MovieRepository movieRepository;
  final CinemaRepository cinemaRepository;

  const MyApp({
    super.key,
    required this.movieRepository,
    required this.cinemaRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc(movieRepository)..add(FetchPopularMovies()),
        ),
        BlocProvider<CinemaBloc>(
          create: (_) =>
              CinemaBloc(cinemaRepository)..add(FetchNearbyCinemas()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Ticket App',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,
          fontFamily: 'AppFonts.primaryFont',
        ),
        home: const MainScreen(),
      ),
    );
  }
}
