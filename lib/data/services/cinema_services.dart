import '../models/cinema_model.dart';

class CinemaService {
  Future<List<CinemaModel>> getNearbyCinemas() async {
    return [
      CinemaModel(
        name: 'Viva Cinema',
        distanceKm: 5.2,
        closingTime: '10:00 PM',
        rating: 4.9,
      ),
      CinemaModel(
        name: 'EbonyLife Cinema',
        distanceKm: 6.5,
        closingTime: '09:00 PM',
        rating: 5.0,
      ),
    ];
  }
}
