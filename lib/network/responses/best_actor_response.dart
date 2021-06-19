import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/data/vos/actor_vo.dart';

part 'best_actor_response.g.dart';

@JsonSerializable()
class BestActorResponse {
  @JsonKey(name: "page")
  int page;

  @JsonKey(name: "results")
  List<ActorVO> actorList;

  BestActorResponse({
    this.page,
    this.actorList,
  });

  factory BestActorResponse.fromJson(Map<String, dynamic> json) =>
      _$BestActorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BestActorResponseToJson(this);
}
