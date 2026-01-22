import 'package:movie_ticket/data/models/cinema_model.dart';
import 'package:movie_ticket/data/services/cinema_services.dart';

class CinemaRepository {
  final CinemaService _cinemaService;

  CinemaRepository(this._cinemaService);

  Future<List<CinemaModel>> getNearbyCinemas() async {
    try {
      return await _cinemaService.getNearbyCinemas();
    } catch (e) {
      rethrow;
    }
  }
}
