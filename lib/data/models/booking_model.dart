import 'movie_model.dart';
import 'cinema_model.dart';
import 'seat_model.dart';

class BookingModel {
  final String id; // unique booking ID
  final MovieModel movie;
  final CinemaModel cinema;
  final DateTime date;
  final String time;
  final List<SeatModel> seats;
  final int persons;
  final double price;

  BookingModel({
    required this.id,
    required this.movie,
    required this.cinema,
    required this.date,
    required this.time,
    required this.seats,
    required this.persons,
    required this.price,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? '',
      movie: MovieModel.fromJson(json['movie']),
      cinema: CinemaModel.fromJson(json['cinema']),
      date: DateTime.parse(json['date']),
      time: json['time'] ?? '',
      seats: (json['seats'] as List<dynamic>)
          .map((s) => SeatModel.fromJson(s))
          .toList(),
      persons: json['persons'] ?? 1,
      price: (json['price'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'movie': movie,
      'cinema': cinema,
      'date': date.toIso8601String(),
      'time': time,
      'seats': seats.map((s) => s.id).toList(),
      'persons': persons,
      'price': price,
    };
  }
}
