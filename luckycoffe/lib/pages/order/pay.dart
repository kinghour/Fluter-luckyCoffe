
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../common/macros.dart';
import 'package:luckycoffe/common/customAppbar.dart';


class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

 back(){
   print('返回成功');
 }

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustAppBar(context,title: '哈哈哈',
                         onPress: (){
                           print('返回成功');
                         },
      ),
    );
  }
}
