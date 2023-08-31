import 'package:hive/hive.dart';
import 'package:ultimate_training/dao/user_dao.dart';
import 'package:ultimate_training/vos/example_class.dart';

class UserDaoImpl extends UserDao{
  @override
  UserVo? getDataFromBox() =>getBox().get('1');
  

  @override
  void save(UserVo userVo) =>getBox().put('1', userVo);
    
  
  
  Box<UserVo>getBox()=>Hive.box<UserVo>('userbox');
  
}