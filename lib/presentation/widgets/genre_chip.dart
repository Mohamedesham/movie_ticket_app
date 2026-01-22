import 'package:flutter/material.dart';
import 'package:movie_ticket/core/constants/colors.dart';
import 'package:movie_ticket/core/constants/fonts.dart';
import 'package:movie_ticket/data/models/genre_model.dart';

class GenreChip extends StatelessWidget {
  final GenreModel genre;
  final bool isSelected;

  const GenreChip({super.key, required this.genre, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected?AppColors.primary:AppColors.textSecondary.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Text(
        genre.name,
        style: AppTextStyle.regular12.copyWith(
          color: isSelected?AppColors.textSecondary:AppColors.textPrimary
        ),
      ),
    );
  }
}
