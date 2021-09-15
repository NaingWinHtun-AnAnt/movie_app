// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_actor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestActorResponse _$BestActorResponseFromJson(Map<String, dynamic> json) {
  return BestActorResponse(
    page: json['page'] as int?,
    actorList: (json['results'] as List<dynamic>?)
        ?.map((e) => ActorVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BestActorResponseToJson(BestActorResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.actorList,
    };
