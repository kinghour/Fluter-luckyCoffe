

import 'package:flutter/cupertino.dart';

class PriceModel with ChangeNotifier{

  double _price;
  int _num;
  String _title;

  void setNum(int num){
    _num = num;
    notifyListeners();
  }

  void setPrice(double price){
    _price = price;
    notifyListeners();
  }

  void setTitle(String title){
    _title = title;
    notifyListeners();
  }

}