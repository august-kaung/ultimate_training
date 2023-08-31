
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'example_class.g.dart';
@JsonSerializable()
@HiveType(typeId: 1)
class UserVo{
  @HiveField(0)
  String ? name;
  @HiveField(1)
  int ? age;
  @HiveField(2)
  String ? address;
  @HiveField(3)
  int ? phone;

  UserVo({this.name, this.age, this.address, this.phone});

  factory UserVo.fromJson(Map<String,dynamic>json)=>_$UserVoFromJson(json);
  Map<String,dynamic>toJson()=>_$UserVoToJson(this);
}