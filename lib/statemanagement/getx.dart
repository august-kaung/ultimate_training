import 'package:get/get.dart';

class HomeController extends GetxController{
  var num=0.obs;
  void incrementNum(){
    num++;
  }
  void decrementNum(){
    num--;
  }
}