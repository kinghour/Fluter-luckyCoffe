import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:luckycoffe/common/loading.dart';

/// 常用颜色
hexffffff() {
  return hexColor('#FFFFFF');
}

hex383838() {
  return hexColor('#383838');
}

hexf2f2f2() {
  return hexColor('#f2f2f2');
}

hexf8f8f8() {
  return hexColor('#f8f8f8');
}

hex808080() {
  return hexColor('#808080');
}

hex88afd5() {
  return hexColor('#88afd5');
}

hexa6a6a6() {
  return hexColor('#a6a6a6');
}

hex505050() {
  return hexColor('#505050');
}

//统一封装下划线
Border borderBottom({Color color, bool show = true}) {
  return Border(
      bottom: BorderSide(
          color: (color == null || !show)
              ? (show ? rgba(242, 242, 242, 1) : Colors.transparent)
              : color,
          width: 1));
}

///*  颜色取值
hexColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

/*用这个方法名写的更规范一点*/
hexWithColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

//rgb色
rgba(int r, int g, int b, double a) {
  return Color.fromRGBO(r, g, b, a);
//  return _RgbaColor(r,g,b,a);
}

//随机色
randColor() {
  return Color.fromRGBO(
      Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
}

///**  屏幕适配

adpWidth(width) {
//  return ScreenUtil().setWidth(width);
  return (ScreenUtil.screenWidthDp * width) / 375.0;
}

adpHeight(height) {
//  return ScreenUtil().setHeight(height);
  return (ScreenUtil.screenWidthDp * height) / 375.0;
}

screenW() {
  return ScreenUtil.screenWidthDp;
}

screenH() {
  return ScreenUtil.screenHeightDp;
}

statusH() {
  print('状态栏 高度  == ${ScreenUtil.statusBarHeight}');
  return ScreenUtil.statusBarHeight;
}

//底部安全区域高度
safeAreaH() {
  return ScreenUtil.bottomBarHeight;
}

///* 拼接图片路径
imagePath(String imageName) {
  String path = 'lib/assets/images/' + imageName;
//  print('图片路径 $path');
  return path;
}

///* 普通路由
pushNavigatorWith(Widget widget) {
//  Navigator.push(context, MaterialPageRoute(builder: (context){
//    return widget;
//  }));
}

///**  加载指示器
showLoading(BuildContext context) {
  //显示
  return Loading.show(context);
}

hidLoading(BuildContext context) {
  //隐藏
  return Loading.hide(context);
}

///**   判断字符串是否有值
bool isBlangkString(String string) {
  string = string.trim(); //删除前导后导空格

  if (string == null) {
    return true;
  }
  if (string.length <= 0) {
    return true;
  }
  return false;
}

///**   一句代码加载组件

Text loadText(
    {String text,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    TextAlign align,
    TextDecoration textDecoration,
    int maxLines,
    }) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: textDecoration),
    textAlign: align,
    maxLines: maxLines,
    overflow: TextOverflow.ellipsis,//省略号
  );
}

///分割线


///加载本地图片
Image loadImageAsset({String imgPath, double width, double height}) {
  return Image.asset(imagePath(imgPath), width: width, height: height);
}

Image loadImageNet(String url,{double width,double height,BoxFit fit}){
  return Image.network(url,width: width,height:height,fit: fit);
}

IconButton loadIconButton(String imgPath,{double width, double height,Function onPress}){
  return IconButton(icon: loadImageAsset(imgPath:imgPath,width: width,height: height), onPressed: onPress);
}

///图文混排按钮
loadMixButton({
  double width,
  double height,
  Text text,
  Image image,
  Color backgroudColor,
  Decoration decoration,
  Function onPress,
}) {
  return InkWell(
    onTap: () {
      onPress();
    },
    child: Container(
      color: backgroudColor,
      width: width,
      height: height,
      decoration: decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          image,
          SizedBox(width: adpWidth(5)),
          text,
        ],
      ),
    ),
  );
}

//loadButton({
//  String title,
//  Color textColor,
//  Color backColor,
//  double fontsize,
//  String imgPath,
//  double width,
//  double height,
//}) {
//  return InkWell(
//    child: Container(
//
//      color: backColor,
////      width: width,
////      height: height,
//      child: imgPath == null ? Center(
//              child:loadText(text: title, color: textColor, fontsize: fontsize),
//            ) : Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Image.asset(imagePath(imgPath),width: width,height: height),
//                loadText(text: title, color: textColor, fontsize: fontsize),
//              ],
//            ),
//    ),
//  );
//}
