import 'package:get_storage/get_storage.dart';

class GetStorageHelper{

  static final box=GetStorage();

  static  putBox(String key,String value)async{
    return box.write(key, value);
  }
  static getBox(String key){
    return box.read(key);
  }

}