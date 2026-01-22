import 'package:equatable/equatable.dart';
import 'package:movie_ticket/data/models/booking_model.dart';

abstract class BookingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateBooking extends BookingEvent {
  final BookingModel booking;

  CreateBooking(this.booking);

  @override
  List<Object?> get props => [booking];
}

class LoadBookings extends BookingEvent {}

class DeleteBooking extends BookingEvent {
  final String bookingId;

  DeleteBooking(this.bookingId);

  @override
  List<Object?> get props => [bookingId];
}
