
import 'dart:ui';

import 'package:flutter/material.dart';
import '../../common/macros.dart';

class PayItem extends StatefulWidget {

//  final String title;
//  final String iconStr;
//  final Function onPress;

   String title;
   String iconStr;
   Function onPress;

  int selectValue;
  int value = 0;

  PayItem(this.title,this.iconStr,{this.value,this.selectValue,this.onPress});


  @override
  _PayItemState createState() => _PayItemState();
}

class _PayItemState extends State<PayItem> {

  Image imageState(){

    String imageName = widget.value == widget.selectValue?'order/ziyuan.png':'order/yuanquan.png';
    return Image.asset(imagePath(imageName),width:adpWidth(18),height:adpWidth(18));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onPress,
      child: Container(

        margin: EdgeInsets.only(left: adpWidth(15)),
        height: adpHeight(60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Image.asset(imagePath(widget.iconStr),width: adpWidth(34),height: adpWidth(34),),
            SizedBox(width: adpWidth(15),),
            //标题
            Text(widget.title,style: TextStyle(color: hex505050(),fontSize:15 ),) ,
            //推荐
            Container(
              margin: EdgeInsets.only(bottom: adpHeight(10),left: adpWidth(5)),
              width: adpWidth(25),
              height: adpHeight(18),
              child:Center(
                child: Text('推荐',style: TextStyle(color: Colors.white,fontSize: 10)),
              ),
              decoration:widget.value == 0 ? BoxDecoration(borderRadius: BorderRadius.circular(2),color: hexColor('#ff8102'),): null,
            ),
            Expanded(child:Container(),),
            //选择按钮
            Container(
              margin: EdgeInsets.only(right: adpWidth(15)),
              child:imageState(),
            ),
            //推荐文字

          ],
        ),
        decoration: BoxDecoration(
          border: borderBottom(),
        ),
      ),
    );
  }
}
