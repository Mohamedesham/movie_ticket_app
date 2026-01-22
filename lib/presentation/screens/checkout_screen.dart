import 'package:flutter/material.dart';
import 'package:movie_ticket/core/constants/fonts.dart';

import '../../core/constants/colors.dart';
import '../../data/models/seat_model.dart';
import '../widgets/primary_button.dart';

class CheckoutScreen extends StatelessWidget {
  final String movieTitle;
  final List<SeatModel> selectedSeats;
  final double ticketPrice;

  const CheckoutScreen({
    super.key,
    required this.movieTitle,
    required this.selectedSeats,
    this.ticketPrice = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    final totalPrice = selectedSeats.length * ticketPrice;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Checkout",
          style: AppTextStyle.bold18.copyWith(color: AppColors.textPrimary),
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie title
            Text(
              movieTitle,
              style: AppTextStyle.semibold20.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // Selected seats
            Text(
              "Selected Seats",
              style: AppTextStyle.bold16.copyWith(color: AppColors.textPrimary),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: selectedSeats
                  .map(
                    (seat) =>
                    Chip(
                      label: Text(
                        seat.id,
                        style: AppTextStyle.regular12.copyWith(
                          color: AppColors.textOnPrimary,
                        ),
                      ),
                      backgroundColor: AppColors.primary,
                    ),
              )
                  .toList(),
            ),
            const SizedBox(height: 24),

            // Total price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: AppTextStyle.bold16.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  "\$${totalPrice.toStringAsFixed(2)}",
                  style: AppTextStyle.bold16.copyWith(color: AppColors.primary),
                ),
              ],
            ),
            const Spacer(),

            // Confirm button
            PrimaryButton(
              label: "Confirm Booking",
              onPressed: () {
                // TODO: Implement booking confirmation logic
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Booking confirmed! 🎉")),
                );
                Navigator.pop(context); // Back to previous screen
              },
            ),
          ],
        ),
      ),
    );
  }
}