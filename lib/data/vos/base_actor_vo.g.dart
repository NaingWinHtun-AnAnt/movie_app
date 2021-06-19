// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_actor_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BaseActorVOAdapter extends TypeAdapter<BaseActorVO> {
  @override
  final int typeId = 2;

  @override
  BaseActorVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BaseActorVO(
      name: fields[11] as String,
      profilePath: fields[12] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BaseActorVO obj) {
    writer
      ..writeByte(2)
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
      other is BaseActorVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseActorVO _$BaseActorVOFromJson(Map<String, dynamic> json) {
  return BaseActorVO(
    name: json['name'] as String,
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$BaseActorVOToJson(BaseActorVO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'profile_path': instance.profilePath,
    };
