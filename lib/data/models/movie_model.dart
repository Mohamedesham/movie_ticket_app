class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<int> genreIds;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: (json['vote_average'] is int)
          ? (json['vote_average'] as int).toDouble()
          : (json['vote_average'] is double)
          ? json['vote_average'] as double
          : double.tryParse(json['vote_average']?.toString() ?? '0') ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
      genreIds:
          (json['genre_ids'] as List<dynamic>?)
              ?.map((e) => int.tryParse(e.toString()) ?? 0)
              .toList() ??
          [],
    );
  }

  String get fullPosterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';

  String get fullBackdropUrl => 'https://image.tmdb.org/t/p/w780$backdropPath';
}
