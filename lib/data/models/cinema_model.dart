class CinemaModel {
  final String name;
  final double distanceKm;
  final String closingTime;
  final double rating;

  CinemaModel({
    required this.name,
    required this.distanceKm,
    required this.closingTime,
    required this.rating,
  });

  factory CinemaModel.fromJson(Map<String, dynamic> json) {
    return CinemaModel(
      name: json['name'] ?? '',
      distanceKm: (json['distance_km'] ?? 0).toDouble(),
      closingTime: json['closing_time'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}
