import 'package:equatable/equatable.dart';

abstract class CinemaEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchNearbyCinemas extends CinemaEvent {}
