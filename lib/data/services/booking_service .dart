import 'package:movie_ticket/data/models/booking_model.dart';

class BookingService {
  final List<BookingModel> _bookings = [];

  Future<void> saveBooking(BookingModel booking) async {
    _bookings.add(booking);
  }

  Future<List<BookingModel>> getBookings() async {
    return _bookings;
  }
  Future<void> deleteBooking(String id) async {
    _bookings.removeWhere((b)=>b.id==id);
  }
  }
