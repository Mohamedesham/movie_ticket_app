import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/presentation/screens/details_screen.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/fonts.dart';
import '../../logic/cinema_bloc/cinema_bloc.dart';
import '../../logic/cinema_bloc/cinema_event.dart';
import '../../logic/cinema_bloc/cinema_state.dart';
import '../../logic/movie_bloc/movie_bloc.dart';
import '../../logic/movie_bloc/movie_event.dart';
import '../../logic/movie_bloc/movie_state.dart';
import '../widgets/movie_card.dart';
import '../widgets/cinema_card.dart';
import '../widgets/custom_bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger data fetch immediately
    context.read<MovieBloc>().add(FetchPopularMovies());
    context.read<CinemaBloc>().add(FetchNearbyCinemas());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome header
              Text(
                "Welcome Back, Mohamed",
                style: AppTextStyle.semibold20.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),

              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search your favourite movie",
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.textPrimary,
                  ),
                  filled: true,
                  fillColor: AppColors.surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: const TextStyle(color: AppColors.textSecondary),
                ),
                style: const TextStyle(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 24),

              // Coming Soon section
              Text(
                "Coming Soon",
                style: AppTextStyle.bold16.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  } else if (state is MoviesLoaded) {
                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => DetailsScreen(movie: movie),
                                ),
                              );
                            },
                            child: MovieCard(movie: movie),
                          );
                        },
                      ),
                    );
                  } else if (state is MovieError) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: AppColors.error),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 24),

              // Cinema Near You section
              Text(
                "Cinema Near You",
                style: AppTextStyle.bold18.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<CinemaBloc, CinemaState>(
                builder: (context, state) {
                  if (state is CinemaLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  } else if (state is CinemasLoaded) {
                    return Column(
                      children: state.cinemas
                          .map((cinema) => CinemaCard(cinema: cinema))
                          .toList(),
                    );
                  } else if (state is CinemaError) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: AppColors.error),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
