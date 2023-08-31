import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static var stringBox = Hive.box<String>('MyStringBox');
  static var intBox = Hive.box<int>('MyIntBox');

  static showPath(){
    print(stringBox.path);
    print(intBox.path);
  }

  static setStringBoxData(String key, String value) {
    return stringBox.put(key, value);
  }

  static getStringBoxData(String key) {
    return stringBox.get(key, defaultValue: '');
  }

  static setIntBoxData(String key, int value) {
   return intBox.put(key, value);
  }

  static getIntBoxData(String key) {
   return intBox.get(key, defaultValue: 000);
  }
}
