import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCarModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home/home.dart';
import '../pages/menu/page/menus.dart';
import '../pages/shopCar/pages/shopCar.dart';
import '../pages/order/order.dart';
import '../pages/mine/mine.dart';
import '../common/macros.dart';
import '../common/routes.dart';

import 'package:oktoast/oktoast.dart';


class TabBarController extends StatefulWidget {
  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {

  String _shoppCarStr;

  final tabBarTitles = ['首页', '菜单', '订单列表', '购物车', '我的'];
  final navTitles = ['首页', '选择咖啡和小食', '订单列表', '购物车', '我的'];
  final tabBarIconsNormal = [
    'tab_home.png',
    'tab_menu.png',
    'tab_order.png',
    'tab_shopCar.png',
    'tab_mine.png'
  ];
  final tabBarIconsSelected = [
    'tab_select_home.png',
    'tab_select_menu.png',
    'tab_select_order.png',
    'tab_select_shopCar.png',
    'tab_select_mine.png'
  ];

  //选中的颜色
  final selectItemColor = hexColor('#2b4c7e');
  //正常状态的颜色
  final normalItemColor = hexColor('696969');
  //字体大小
  double fontSize = 10.0;
  //图标大小
  double iconWidth = 48;
  double iconHeight = 48;

  //导航栏背景颜色
  final navBarBackgroundColor = Color(0xFFFFFFFF);

  var _selectIndex = 0;
  var _body;
  var pages;

  Image getImageWithPath(String path) {
    var pathStr = 'lib/assets/images/' + path;
    return Image.asset(pathStr, width: ScreenUtil().setWidth(iconWidth), height: ScreenUtil().setWidth(iconWidth));
  }

  //选择图片
  Image getTabItemIcon(int selectIndex) {
    if (selectIndex == _selectIndex) {
      //选中
      return getImageWithPath(tabBarIconsSelected[selectIndex]);
    }
    return getImageWithPath(tabBarIconsNormal[selectIndex]);
  }

  //选择标题
  Text getTabItemTitle(int select) {
    if (select == _selectIndex) {
      //选中
      return Text(
          tabBarTitles[select],
          style: TextStyle(color: selectItemColor, fontSize: fontSize));
    }
    return Text(
      tabBarTitles[select],
      style: TextStyle(color: normalItemColor, fontSize: fontSize),
    );
  }

  //状态栏字体颜色选择
 Brightness brightType(){
    if(_selectIndex==0 || _selectIndex==4){
      print('这是 light  $_selectIndex');
      return Brightness.light;
  }else{
      print('这是 dark  $_selectIndex'  );
      return Brightness.dark;
    }
}


  initSharedPres(BuildContext context)async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _shoppCarStr = prefs.getString('shopCart');
    ShopCarModel _shopCarModel = Provider.of<ShopCarModel>(context);
    if(_shoppCarStr != null){
      Map data = json.decode(_shoppCarStr);
      _shopCarModel.init(data);
    }
  }

  @override
  void initState() {

//    initSharedPres(context);


    super.initState();


    pages = <Widget>[
      HomePage(),
      MenuPage(),
      OrderPage(),
      ShopCarPage(),
      MinePage()
    ];
  }

  @override
  Widget build(BuildContext context) {

    //初始化屏幕适配插件,未初始化前调用插件属性会报错
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    _body = IndexedStack(//使用IndexedStack放置tabs下页面重绘
      children: pages,
      index: _selectIndex,
    );

    return OKToast(  //OKToast:弹框
      dismissOtherOnShow: true, //全局设置隐藏之前的属性,每次当你显示新的 toast 时,旧的就会被关闭
      child: MaterialApp(
          routes: routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily:'PingFang'),
          home: Scaffold(
            body: _body,
            bottomNavigationBar: BottomAppBar(
              child:Row(
                children: <Widget>[
                  SizedBox(height: ScreenUtil().setHeight(98),width: getItemsWidth(),child:tabBar(0)),
                  SizedBox(height: ScreenUtil().setHeight(98),width: getItemsWidth(),child:tabBar(1)),
                  SizedBox(height: ScreenUtil().setHeight(98),width: getItemsWidth(),child:tabBar(2)),
                  SizedBox(height: ScreenUtil().setHeight(98),width: getItemsWidth(),child:tabBar(3)),
                  SizedBox(height: ScreenUtil().setHeight(98),width: getItemsWidth(),child:tabBar(4)),
                ],
              ),
            ),
          )
      ),
    );
  }

  double getItemsWidth(){
    return MediaQuery.of(context).size.width/tabBarTitles.length;
  }

  //是否隐藏顶部导航
  bool isHideNav(){
    if(_selectIndex == 0 || _selectIndex == 4){
       return true;
    }else{
      return false;
    }
  }

  // 自定义tabBarItem
  Widget tabBar(int index) {

    //构造返回的Widget
    Widget item = Container(
      child: GestureDetector(

        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: ScreenUtil().setHeight(10)),
            getTabItemIcon(index),
            SizedBox(height: ScreenUtil().setHeight(6),),
            getTabItemTitle(index),
          ],
        ),
        onTap: () {
          if (_selectIndex != index) {
            setState(() {
              _selectIndex = index;
            });
          }
        },
      ),
    );
    return item;
  }



}
