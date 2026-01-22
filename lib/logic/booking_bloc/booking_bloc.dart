import 'package:bloc/bloc.dart';
import 'package:movie_ticket/data/repositories/booking_repository.dart';
import 'package:movie_ticket/logic/booking_bloc/booking_event.dart';
import 'package:movie_ticket/logic/booking_bloc/booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingRepository bookingRepository;

  BookingBloc(this.bookingRepository) : super(BookingInitial()) {
    on<CreateBooking>(_onCreateBooking);
    on<LoadBookings>(_onLoadBookings);
    on<DeleteBooking>(_onDeleteBooking);
  }

  Future<void> _onCreateBooking(
    CreateBooking event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());
    try {
      await bookingRepository.saveBooking(event.booking);
      emit(BookingSuccess());
      final bookings = await bookingRepository.getBookings();
      emit(BookingsLoaded(bookings));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  Future<void> _onLoadBookings(
    LoadBookings event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());
    try {
      final bookings = await bookingRepository.getBookings();
      emit(BookingsLoaded(bookings));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }

  Future<void> _onDeleteBooking(
    DeleteBooking event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingLoading());
    try {
      await bookingRepository.deleteBooking(event.bookingId);
      final bookings = await bookingRepository.getBookings();
      emit(BookingsLoaded(bookings));
    } catch (e) {
      emit(BookingError(e.toString()));
    }
  }
}
