// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_class.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserVoAdapter extends TypeAdapter<UserVo> {
  @override
  final int typeId = 1;

  @override
  UserVo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserVo(
      name: fields[0] as String?,
      age: fields[1] as int?,
      address: fields[2] as String?,
      phone: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserVo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserVoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVo _$UserVoFromJson(Map<String, dynamic> json) => UserVo(
      name: json['name'] as String?,
      age: json['age'] as int?,
      address: json['address'] as String?,
      phone: json['phone'] as int?,
    );

Map<String, dynamic> _$UserVoToJson(UserVo instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'address': instance.address,
      'phone': instance.phone,
    };
