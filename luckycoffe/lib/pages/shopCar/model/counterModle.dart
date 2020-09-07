

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CounterModel with ChangeNotifier{

  int _count = 0;
//  CounterModel(this._count);
  int get() {
    return _count;
  }

  void add(){
    _count ++;
    notifyListeners();
  }
  
}