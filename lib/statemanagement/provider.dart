import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{
  int dataa=0;

  void incrementData(){
    dataa++;
    notifyListeners();
  }
  void decrementData(){
    dataa--;
    notifyListeners();

  }
}