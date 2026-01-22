import 'package:equatable/equatable.dart';
import 'package:movie_ticket/data/models/cinema_model.dart';

abstract class CinemaState extends Equatable {
  @override
  List<Object> get props => [];
}

class CinemaInitial extends CinemaState {}

class CinemaLoading extends CinemaState {}

class CinemasLoaded extends CinemaState {
  final List<CinemaModel> cinemas;

  CinemasLoaded(this.cinemas);

  @override
  List<Object> get props => [cinemas];
}

class CinemaError extends CinemaState {
  final String message;

  CinemaError(this.message);

  @override
  List<Object> get props => [message];
}
