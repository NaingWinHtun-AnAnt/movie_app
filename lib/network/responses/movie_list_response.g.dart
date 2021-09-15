// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return MovieListResponse(
    date: json['dates'] == null
        ? null
        : DateVO.fromJson(json['dates'] as Map<String, dynamic>),
    page: json['page'] as int?,
    result: (json['results'] as List<dynamic>?)
        ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieListResponseToJson(MovieListResponse instance) =>
    <String, dynamic>{
      'dates': instance.date,
      'page': instance.page,
      'results': instance.result,
    };
