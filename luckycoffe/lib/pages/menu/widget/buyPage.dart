
import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/common/customAppbar.dart';

// ignore: camel_case_types
class buyPage extends StatefulWidget {
  @override
  _buyPageState createState() => _buyPageState();
}

// ignore: camel_case_types
class _buyPageState extends State<buyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: CustAppBar(context,title: 'ceshi',),
//    body: Container(
//      width:screenW(),
//      height: adpHeight(68),
//      color: Colors.yellow,
//    ),
//    appBar: AppBar(brightness: Brightness.light,),
    body: SafeArea(
        child: Container(
      width:screenW(),
      height: adpHeight(68),
      color: Colors.yellow,
      ),
     )
    );
  }
}
