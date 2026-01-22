import 'package:flutter/material.dart';
import 'package:movie_ticket/core/constants/colors.dart';
import 'package:movie_ticket/core/constants/fonts.dart';
import 'package:movie_ticket/data/models/cinema_model.dart';

class CinemaCard extends StatelessWidget {
  final CinemaModel cinema;

  const CinemaCard({super.key, required this.cinema});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // Cinema icon
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.local_movies, color: AppColors.primary),
          ),
          const SizedBox(width: 12),

          // Cinema details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cinema.name,
                  style: AppTextStyle.bold16.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${cinema.distanceKm.toStringAsFixed(1)} km • Closes at ${cinema.closingTime}",
                  style: AppTextStyle.regular12.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Rating
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.starGold, size: 16),
              const SizedBox(width: 4),
              Text(
                cinema.rating.toStringAsFixed(1),
                style: AppTextStyle.bold14.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
