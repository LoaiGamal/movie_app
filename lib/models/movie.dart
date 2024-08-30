import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie(this.adult, this.originalTitle, this.genreIds, this.popularity, this.video,
      this.voteCount,
      {required this.backdropPath,
      required this.posterPath,
      required this.id,
      required this.overview,
      required this.title,
      required this.originalLanguage,
      required this.releaseDate,
      required this.voteAverage});

  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  int? id;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  String? title;
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  double? voteCount;


  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
