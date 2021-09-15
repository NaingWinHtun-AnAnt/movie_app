// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActorVOAdapter extends TypeAdapter<ActorVO> {
  @override
  final int typeId = 1;

  @override
  ActorVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActorVO(
      adult: fields[0] as bool?,
      gender: fields[1] as int?,
      id: fields[2] as int,
      knownFor: (fields[3] as List?)?.cast<MovieVO>(),
      popularity: fields[4] as double?,
      name: fields[11] as String?,
      profilePath: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ActorVO obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.knownFor)
      ..writeByte(4)
      ..write(obj.popularity)
      ..writeByte(11)
      ..write(obj.name)
      ..writeByte(12)
      ..write(obj.profilePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActorVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorVO _$ActorVOFromJson(Map<String, dynamic> json) {
  return ActorVO(
    adult: json['adult'] as bool?,
    gender: json['gender'] as int?,
    id: json['id'] as int,
    knownFor: (json['known_for'] as List<dynamic>?)
        ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
        .toList(),
    popularity: (json['popularity'] as num?)?.toDouble(),
    name: json['name'] as String?,
    profilePath: json['profile_path'] as String?,
  );
}

Map<String, dynamic> _$ActorVOToJson(ActorVO instance) => <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.knownFor,
      'popularity': instance.popularity,
    };
