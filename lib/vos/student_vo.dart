import 'package:json_annotation/json_annotation.dart';

part 'student_vo.g.dart';
@JsonSerializable()
class StudentVO{
  int ? id;
  String ? name;
  int ? age;
  String ? gender;
  int ? teacherId;

  StudentVO({this.id, this.name, this.age, this.gender, this.teacherId});

  factory StudentVO.fromJson(Map<dynamic,dynamic>json)=>_$StudentVOFromJson(json);
  Map<String,dynamic>toJson()=>_$StudentVOToJson(this);


}