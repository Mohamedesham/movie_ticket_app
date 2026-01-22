import 'package:flutter/material.dart';
import 'package:movie_ticket/core/constants/fonts.dart';
import 'package:movie_ticket/data/models/movie_model.dart';
import 'package:movie_ticket/presentation/screens/seat_selection_screen.dart';

import '../../core/constants/colors.dart';
import '../../data/models/genre_model.dart';
import '../widgets/genre_chip.dart';
import '../widgets/primary_button.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Dummy genre mapping (replace with real genre names if needed)
    final genreMap = {
      28: "Action",
      12: "Adventure",
      16: "Animation",
      35: "Comedy",
      18: "Drama",
      14: "Fantasy",
    };

    final genres = movie.genreIds
        .map((id) => GenreModel(id: id, name: genreMap[id] ?? "Genre"))
        .toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Backdrop image
            Stack(
              children: [
                Image.network(
                  movie.fullBackdropUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ],
            ),

            // Movie content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    Text(
                      movie.title,
                      style: AppTextStyle.semibold20.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.starGold, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          "${movie.voteAverage.toStringAsFixed(1)} • ${movie.releaseDate}",
                          style: AppTextStyle.bold14.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Genres
                    Wrap(
                      spacing: 8,
                      children: genres
                          .map((genre) => GenreChip(genre: genre))
                          .toList(),
                    ),
                    const SizedBox(height: 16),

                    // Overview
                    Text(
                      "Overview",
                      style: AppTextStyle.bold16.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movie.overview,
                      style: AppTextStyle.bold14.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Book Ticket button
            Padding(
              padding: const EdgeInsets.all(16),
              child: PrimaryButton(
                label: "Book Ticket",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SeatSelectionScreen(
                        movieTitle: movie.title,
                        ticketPrice: 50.0,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
