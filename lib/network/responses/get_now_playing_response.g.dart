// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_now_playing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetNowPlayingResponse _$GetNowPlayingResponseFromJson(
    Map<String, dynamic> json) {
  return GetNowPlayingResponse(
    date: json['dates'] == null
        ? null
        : DateVO.fromJson(json['dates'] as Map<String, dynamic>),
    page: json['page'] as int,
    result: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : MovieVO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetNowPlayingResponseToJson(
        GetNowPlayingResponse instance) =>
    <String, dynamic>{
      'dates': instance.date,
      'page': instance.page,
      'results': instance.result,
    };
