import 'package:flutter/material.dart';
import 'package:movie_ticket/core/constants/fonts.dart';
import 'package:movie_ticket/data/models/seat_model.dart';

import '../../core/constants/colors.dart';

class SeatWidget extends StatelessWidget {
  final SeatModel seat;
  final VoidCallback onTap;

  const SeatWidget({super.key, required this.seat, required this.onTap});

  Color _getSeatColor() {
    switch (seat.status) {
      case SeatStatus.available:
        return AppColors.background;
      case SeatStatus.reserved:
        return AppColors.error;
      case SeatStatus.selected:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: seat.status == SeatStatus.reserved ? null : onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          color: _getSeatColor(),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: AppColors.textSecondary.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            seat.id,
            style: AppTextStyle.regular12.copyWith(
              color: seat.status == SeatStatus.selected
                  ? AppColors.surface
                  : AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
