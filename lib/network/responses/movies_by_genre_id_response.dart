import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

part 'movies_by_genre_id_response.g.dart';

@JsonSerializable()
class MoviesByGenreIdResponse {
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "items")
  List<MovieVO> movies;

  @JsonKey(name: "item_count")
  int itemCount;

  MoviesByGenreIdResponse({
    this.id,
    this.movies,
    this.itemCount,
  });

  factory MoviesByGenreIdResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesByGenreIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesByGenreIdResponseToJson(this);
}
