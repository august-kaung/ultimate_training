import 'package:ultimate_training/vos/example_class.dart';

abstract class UserDao{

  void save(UserVo userVo);
  UserVo ? getDataFromBox();
}