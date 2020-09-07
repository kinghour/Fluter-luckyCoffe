import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCartData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShopCarModel with ChangeNotifier {

  Map<String, ShoppCartData> _shopCartMap = {};

  get data => _shopCartMap;

  double totalPrice = 0;

  ///初始化
  init(Map<String, dynamic> data) {
    for (var key in data.keys) {
      Map val = data[key];
      _shopCartMap['$key'] = ShoppCartData.fromJson(val);
      totalPrice = val['price']* val['number'];
    }
    print('');
  }

  ///添加
  add(ShoppCartData data) {
    // 找出与传入的id相同的商品，如果没有返回null
    String key;
    _shopCartMap.keys.forEach((key) {
      String id = data.id.toString();
      if (id == key) {
        key = id;
      } else {
        key = null;
      }
    });

    if (key == null) {
      key = data.id.toString();
      data.checked = true;
      _shopCartMap.addAll({
        key: data,
      });
      print('');
    } else {
      ShoppCartData nowData = _shopCartMap[key];
      nowData.number = nowData.number + data.number;
      _shopCartMap['$key'] = nowData;
    }

    _save();
    _calPrice();
    notifyListeners();
  }

  ///改
  change(String id, {@required ShoppCartData data}) {
    _shopCartMap[id] = data;
    _save();
    _calPrice();
//    notifyListeners();
  }

  ///移除购物车
  remove(String id) {
    _shopCartMap.remove(id);
    _calPrice();
    _save();

  }

  ///保存本地
  _save() async {
    SharedPreferences pres = await SharedPreferences.getInstance();
    pres.setString('shopCar', json.encode(_shopCartMap));
    print('');
  }

  ///计算总价
  _calPrice() {
    double price = 0;
    _shopCartMap.values.forEach((ShoppCartData data) {
      price = price + data.price * data.number;
    });
    totalPrice = price;
  }
}
