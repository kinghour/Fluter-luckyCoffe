

import 'package:flutter/material.dart';
import 'package:luckycoffe/foundation/tabBarController.dart';
import 'package:luckycoffe/pages/home/home.dart';

//我的
import 'package:luckycoffe/pages/login/loginType.dart';
import 'package:luckycoffe/pages/login/fillPhone.dart';
import 'package:luckycoffe/pages/login/selectArea.dart';
import 'package:luckycoffe/pages/login/userAgreenment.dart';
//订单
import 'package:luckycoffe/pages/order/pay.dart';
import 'package:luckycoffe/pages/order/paySelectList.dart';
//菜单
import 'package:luckycoffe/pages/menu/widget/buyPage.dart';
import 'package:luckycoffe/pages/shopCar/pages/confirmOrderPage.dart';
//购物车
import 'package:luckycoffe/pages/shopCar/pages/shopCar.dart';
import 'package:luckycoffe/pages/shopCar/pages/homePage2Copy.dart';

import '../main.dart';

final routes = {

  '/':(context)=> TabBarController(),
  '/loginType':(context)=> LoginType(),
  '/fillPhone':(context)=> FillPhonePage(),
  '/selectArea':(context)=> SelectAreaPage(),
  '/userAgreenment':(context)=> UserAreenmentPage(),
  '/Pay':(context)=> Pay(),
  '/PaySelectList':(context,)=> PaySelectList(),
  '/buyPage':(context)=> buyPage(),
  '/HomePage2Copy':(context)=> HomePage2Copy(),
  '/CofirmOrderPage':(context)=> CofirmOrderPage(),
  '/shopCarPage':(context)=> ShopCarPage(),


};

/// 监听route
Route getRoutes(RouteSettings settings) {
  String routeName = settings.name;
  final Function builder = routes[routeName];

  print(settings);

  if(builder == null) {
    return null;
  } else {
    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) => builder(context, args: settings.arguments)
    );
  }
}
//固定写法
//ignore: missing_return, top_level_function_literal_block
//var onGenerateRoute = (RouteSettings settings) {
//  // 统一处理
//  final String name = settings.name;
//  final Function pageContentBuilder = routes[name];
//  if (pageContentBuilder != null) {
//    // ignore: missing_return
//    if (settings.arguments != null) {
//      final Route route = MaterialPageRoute(
//          builder: (context) =>
//              pageContentBuilder(context, arguments: settings.arguments));
//      return route;
//    }else{
//      final Route route = MaterialPageRoute(
//          builder: (context) =>
//              pageContentBuilder(context));
//      return route;
//    }
//  }
//};