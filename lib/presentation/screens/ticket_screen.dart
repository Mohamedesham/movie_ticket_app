import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_ticket/core/constants/colors.dart';
import 'package:movie_ticket/core/constants/fonts.dart';
import 'package:movie_ticket/logic/booking_bloc/booking_bloc.dart';
import 'package:movie_ticket/data/models/booking_model.dart';
import '../../data/models/cinema_model.dart';
import '../../data/models/movie_model.dart';
import '../../data/models/seat_model.dart';
import '../../logic/booking_bloc/booking_event.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildTicketCard(
          context,
          BookingModel(
            id: "fake1",
            movie: MovieModel(
              id: 1,
              title: "Inception",
              overview: "A mind-bending thriller",
              posterPath: "/inception.jpg",
              releaseDate: "2010-07-16",
              voteAverage: 8.8,
              backdropPath: '',
              voteCount: 120,
              genreIds: [],
            ),
            cinema: CinemaModel(
              name: "Galaxy Mall",
              distanceKm: 2.5,
              closingTime: "11:00 PM",
              rating: 4.5,
            ),
            date: DateTime.now(),
            time: "7:30 PM",
            seats: [
              SeatModel(
                id: "A1",
                status: SeatStatus.selected,
                row: 0,
                column: 0,
              ),
              SeatModel(
                id: "A2",
                status: SeatStatus.selected,
                row: 0,
                column: 1,
              ),
            ],
            persons: 2,
            price: 100.0,
          ),
        ),
      ],
    );
  }

  Widget _buildTicketCard(BuildContext context, BookingModel booking) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.textSecondary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.background.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie title + rating
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(booking.movie.title, style: AppTextStyle.bold16),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.starGold, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    booking.movie.voteAverage.toStringAsFixed(1),
                    style: AppTextStyle.regular12.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            booking.movie.releaseDate ?? '',
            style: AppTextStyle.regular12.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),

          // Cinema, Date, Time, Seats, Persons
          Text('Cinema: ${booking.cinema.name}', style: AppTextStyle.regular12),
          Text(
            'Date: ${booking.date.toLocal().toString().split(" ")[0]}',
            style: AppTextStyle.regular12,
          ),
          Text('Time: ${booking.time}', style: AppTextStyle.regular12),
          Text(
            'Seats: ${booking.seats.map((s) => s.id).join(", ")}',
            style: AppTextStyle.regular12,
          ),
          Text('Persons: ${booking.persons}', style: AppTextStyle.regular12),
          Text(
            'Price: \$${booking.price.toStringAsFixed(2)}',
            style: AppTextStyle.regular12,
          ),

          const SizedBox(height: 16),

          // Actions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // handle checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Checkout'),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  context.read<BookingBloc>().add(DeleteBooking(booking.id));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
