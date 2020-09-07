import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:provider/provider.dart';

import '../model/counterModle.dart';

class HomePage2Copy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage2CopyState();
}

class _HomePage2CopyState extends State<HomePage2Copy> {
  CounterModel counter = CounterModel();

  @override
  Widget build(BuildContext context) {
    String value = ModalRoute.of(context).settings.arguments;
    print('打印 : $value');

    return ChangeNotifierProvider(
      create: (_) => counter,
      child: Scaffold(
        appBar: AppBar(
          title: Text("第二页"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 100),
          width: 300,
          height: 300,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            child: Image.asset(
              imagePath('menu/menu_orderBanner.jpg'),
              width: 335,
              height: adpHeight(150),
              fit: BoxFit.cover,
            ),
          ),
          decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(20),
              color: Colors.red),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, "我是回传的值");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
