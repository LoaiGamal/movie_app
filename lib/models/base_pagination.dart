import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/models/movie.dart';
part 'base_pagination.g.dart';

@JsonSerializable()
class BasePagination {
  BasePagination(this.dates, this.page, this.movies, this.totalPages, this.totalResults);

  Map<String, dynamic>? dates;
  int? page;
  @JsonKey(name: 'results')
  List<Movie>? movies;
  @JsonKey(name: 'total_pages')
  int? totalPages;
  @JsonKey(name: 'total_results')
  int? totalResults;

  factory BasePagination.fromJson(Map<String, dynamic> json) => _$BasePaginationFromJson(json);
}