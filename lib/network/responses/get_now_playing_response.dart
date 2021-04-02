import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/date_vo.dart';
import 'package:movie_app/data/vos/movie_vo.dart';

part 'get_now_playing_response.g.dart';

@JsonSerializable()
class GetNowPlayingResponse {
  @JsonKey(name: "dates")
  DateVO date;

  @JsonKey(name: "page")
  int page;

  @JsonKey(name: "results")
  List<MovieVO> result;

  GetNowPlayingResponse({
    this.date,
    this.page,
    this.result,
  });

  factory GetNowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNowPlayingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNowPlayingResponseToJson(this);
}
