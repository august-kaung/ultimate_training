// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentVO _$StudentVOFromJson(Map<dynamic, dynamic> json) => StudentVO(
      id: json['id'] as int?,
      name: json['name'] as String?,
      age: json['age'] as int?,
      gender: json['gender'] as String?,
      teacherId: json['teacherId'] as int?,
    );

Map<String, dynamic> _$StudentVOToJson(StudentVO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'gender': instance.gender,
      'teacherId': instance.teacherId,
    };
