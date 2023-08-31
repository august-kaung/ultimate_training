import 'package:json_annotation/json_annotation.dart';

part 'teacher_vo.g.dart';
@JsonSerializable()
class TeacherVO{
  int ? id;
  String ? name;

  TeacherVO({this.id, this.name});
  factory TeacherVO.fromJson(Map<dynamic,dynamic>json)=>_$TeacherVOFromJson(json);
  Map<String,dynamic>toJson()=>_$TeacherVOToJson(this);
}