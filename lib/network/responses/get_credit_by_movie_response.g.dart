// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credit_by_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditByMovieResponse _$GetCreditByMovieResponseFromJson(
    Map<String, dynamic> json) {
  return GetCreditByMovieResponse(
    id: json['id'] as int?,
    cast: (json['cast'] as List<dynamic>?)
        ?.map((e) => CreditVO.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$GetCreditByMovieResponseToJson(
        GetCreditByMovieResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
