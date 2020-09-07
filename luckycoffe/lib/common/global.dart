import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:luckycoffe/common/loading.dart';

class Global {
  static String appname = '瑞幸咖啡';

  /// 常用颜色
  static Color hex383838 = hexWithColor('#383838');
  static Color hexF2F2F2 = hexWithColor('#F2F2F2');
  static Color hex808080 = hexWithColor('#808080');
  static Color hex88AFD5 = hexWithColor('#88AFD5');
  static Color hexF6A6A6 = hexWithColor('#A6A6A6');
  static Color hex505050 = hexWithColor('#505050');
  //hex
  static Color hexWithColor(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  //rgb
  static Color rgba(int r, int g, int b, double a) {
    return Color.fromRGBO(r, g, b, a);
  }

//  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//
//  /// 获取当前的state
//  static NavigatorState getCurrentState() => navigatorKey.currentState;
//
//  /// 获取当前的context
//  static BuildContext getCurrentContext() => navigatorKey.currentContext;
//
//  /// 返回页面
//  static void pop() => getCurrentState().pop();

  static final loading = Loading();

  ///适配宽高
  static double adpW(double wdith) {
    return (ScreenUtil.screenWidthDp * wdith) / 375.0;
  }

  static double adpH(double height) {
    return (ScreenUtil.screenWidthDp * height) / 375.0;
  }

  static init() {}
}
