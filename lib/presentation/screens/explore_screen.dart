import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/logic/movie_bloc/movie_bloc.dart';
import 'package:movie_ticket/logic/movie_bloc/movie_event.dart';

import '../../core/constants/colors.dart';
import '../../data/models/genre_model.dart';
import '../../logic/movie_bloc/movie_state.dart';
import '../widgets/genre_chip.dart';
import '../widgets/movie_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _currentIndex = 1;
  String _searchQuery = '';
  int? _selectedGenreId;

  final genres = [
    GenreModel(id: 28, name: "Action"),
    GenreModel(id: 12, name: "Adventure"),
    GenreModel(id: 16, name: "Animation"),
    GenreModel(id: 35, name: "Comedy"),
    GenreModel(id: 18, name: "Drama"),
    GenreModel(id: 14, name: "Fantasy"),
  ];

  void _onSearch(String query) {
    setState(() => _searchQuery = query);
    context.read<MovieBloc>().add((SearchMovies(query)));
  }

  void _onGenreSelected(int genreId) {
    setState(() => _selectedGenreId = genreId);
    final genreName = genres.firstWhere((g) => g.id == genreId).name;
    context.read<MovieBloc>().add(SearchMovies(genreName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                onSubmitted: _onSearch,
                decoration: InputDecoration(
                  hintText: "Search movies...",
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
              const SizedBox(height: 16),

              // Genre filter row
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genres.length,
                  itemBuilder: (context, index) {
                    final genre = genres[index];
                    return GenreChip(
                      genre: genre,
                      isSelected: _selectedGenreId == genre.id,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Movie results
              Expanded(
                child: BlocBuilder<MovieBloc, MovieState>(
                  builder: (context, state) {
                    if (state is MovieLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      );
                    } else if (state is MoviesLoaded) {
                      return ListView.builder(
                        itemCount: state.movies.length,
                        itemBuilder: (context, index) {
                          final movie = state.movies[index];
                          return MovieCard(movie: movie);
                        },
                      );
                    } else if (state is MovieError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: AppColors.error),
                        ),
                      );
                    }
                    return const Center(
                      child: Text(
                        "Search or select a genre to explore movies",
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
