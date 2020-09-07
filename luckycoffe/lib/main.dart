import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCarModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'common/routes.dart';
import 'foundation/tabBarController.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/global.dart';

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'pages/shopCar/model/counterModle.dart';

//void main() => Global.init().then((e) => runApp(MyHomePage()));

String _shopCarStr;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  //从磁盘加载缓存
  SharedPreferences pres = await SharedPreferences.getInstance();
  _shopCarStr = pres.getString('shopCar');


  Global.init();

//全局provider初始化,单个界面的状态管理放在这里会造成大量的性能消耗
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: ShopCarModel()),
    ],
    child: MyHomePage(),
  ));

//  runApp(MyHomePage());

//  if (Platform.isAndroid) {
//    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
//    SystemUiOverlayStyle systemUiOverlayStyle =
//    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
//    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
//  }

}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    ShopCarModel _shopCarModel = Provider.of<ShopCarModel>(context);
    if(_shopCarStr != null){
      Map data = json.decode(_shopCarStr);
      _shopCarModel.init(data);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarController(),
    );

  }

}
