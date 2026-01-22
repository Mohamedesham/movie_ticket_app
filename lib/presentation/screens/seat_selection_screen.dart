import 'package:flutter/material.dart';
import 'package:movie_ticket/core/constants/fonts.dart';
import '../../core/constants/colors.dart';
import '../../data/models/seat_model.dart';
import '../widgets/primary_button.dart';
import '../widgets/seat_widget.dart';
import 'checkout_screen.dart';

class SeatSelectionScreen extends StatefulWidget {
  final String movieTitle;
  final double ticketPrice;

  const SeatSelectionScreen({
    super.key,
    required this.movieTitle,
    this.ticketPrice = 50.0,
  });

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  final List<SeatModel> seats = List.generate(40, (index) {
    final row = index ~/ 8; // integer division → row number
    final column = index % 8;
    return SeatModel(
      id: (index + 1).toString(),
      status: SeatStatus.available,
      row: row,
      column: column,
    );
  });

  List<SeatModel> get selectedSeats =>
      seats.where((s) => s.status == SeatStatus.selected).toList();

  void _toggleSeat(SeatModel seat) {
    setState(() {
      if (seat.status == SeatStatus.available) {
        seat.status = SeatStatus.selected;
      } else if (seat.status == SeatStatus.selected) {
        seat.status = SeatStatus.available;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalPrice = selectedSeats.length * widget.ticketPrice;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Select Seats",
          style: AppTextStyle.bold18.copyWith(color: AppColors.textPrimary),
        ),
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
      ),
      body: Column(
        children: [
          // Movie title
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              widget.movieTitle,
              style: AppTextStyle.semibold20.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),

          // Seat grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: seats.length,
              itemBuilder: (context, index) {
                final seat = seats[index];
                return SeatWidget(seat: seat, onTap: () => _toggleSeat(seat));
              },
            ),
          ),

          // Total price + button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
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
                      style: AppTextStyle.bold16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                PrimaryButton(
                  label: "Proceed to Checkout",
                  isDisabled: selectedSeats.isEmpty,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CheckoutScreen(
                          movieTitle: widget.movieTitle,
                          selectedSeats: selectedSeats,
                          ticketPrice: widget.ticketPrice,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
