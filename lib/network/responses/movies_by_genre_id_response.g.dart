// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_by_genre_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesByGenreIdResponse _$MoviesByGenreIdResponseFromJson(
    Map<String, dynamic> json) {
  return MoviesByGenreIdResponse(
    id: json['id'] as String,
    movies: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : MovieVO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    itemCount: json['item_count'] as int,
  );
}

Map<String, dynamic> _$MoviesByGenreIdResponseToJson(
        MoviesByGenreIdResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'items': instance.movies,
      'item_count': instance.itemCount,
    };
