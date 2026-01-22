import 'package:bloc/bloc.dart';
import 'package:movie_ticket/data/repositories/cinema_repository.dart';
import 'package:movie_ticket/logic/cinema_bloc/cinema_event.dart';
import 'package:movie_ticket/logic/cinema_bloc/cinema_state.dart';

class CinemaBloc extends Bloc<CinemaEvent, CinemaState> {
  final CinemaRepository cinemaRepository;

  CinemaBloc(this.cinemaRepository) : super(CinemaInitial()) {
    on<FetchNearbyCinemas>(_onFetchNearbyCinemas);
  }

  Future<void> _onFetchNearbyCinemas(
    FetchNearbyCinemas event,
    Emitter<CinemaState> emit,
  ) async {
    emit(CinemaLoading());
    try {
      final cinemas = await cinemaRepository.getNearbyCinemas();
      emit(CinemasLoaded(cinemas));
    } catch (e) {
      emit(CinemaError(e.toString()));
    }
  }
}
