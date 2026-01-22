import 'package:movie_ticket/data/models/booking_model.dart';
import 'package:movie_ticket/data/services/booking_service%20.dart';

class BookingRepository {
  final BookingService _bookingService;

  BookingRepository(this._bookingService);

  Future<void> saveBooking(BookingModel booking) async {
    return await _bookingService.saveBooking(booking);
  }

  Future<List<BookingModel>> getBookings() async {
    return await _bookingService.getBookings();
  }

  Future<void> deleteBooking(String id) async {
    return _bookingService.deleteBooking(id);
  }
}
