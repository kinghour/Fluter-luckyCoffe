
import 'package:flutter/material.dart';
import 'package:luckycoffe/common/global.dart';
import '../../common/macros.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderListRow extends StatelessWidget {


  final BuildContext context;
  final int orderStatus;
  final String address;
  final String time;
  final String goodsName;
  final String orderNum;
  final String price;
  final Function onPress;

  OrderListRow(this.orderStatus,this.context,{

    this.address,
    this.time,
    this.goodsName,
    this.orderNum,
    this.price,
    this.onPress
  });

  //状态标签
   Widget statusText(){
     var text = '';
     var color = hexa6a6a6();

     switch(this.orderStatus){
       case 1:{
         text = '待付款';
         color = hex88afd5();

       }break;
       case 2:{
         text = '已完成';
         color = hexa6a6a6();
       }break;
       case 3:{
         text = '已取消';
         color = hexa6a6a6();
       }break;
       default:{

       }
     }
     return Text(text,style: TextStyle(color: color,fontSize:13));
   }


   List<Widget> buttons (){

     List <Widget> button = [];

     //支付按钮
     var payBtn = Container(
       width: adpWidth(74),
       height: adpHeight(28),
       margin: EdgeInsets.only(left: adpWidth(10)),
       child: OutlineButton(
           child: Text('去支付',style: TextStyle(color: hexColor('#ff8102'),fontSize: 13),),
           borderSide: BorderSide(
             color:hexColor('#ff8102'),
             width: adpWidth(0.8),
           ),
           onPressed:(){
             Navigator.pushNamed(this.context, '/PaySelectList');
             print('点击 去支付');
           }
       ),
     );

     //再来一单
     var againBtn = Container(
//       width: adpWidth(76),
       height: adpHeight(28),
       margin: EdgeInsets.only(left: Global.adpW(10)),
       child: OutlineButton(
           child: Text('再来一单',style: TextStyle(color:hex383838(),fontSize: 13),),
           borderSide: BorderSide(
             color:Global.hexF2F2F2,
             width: adpWidth(0.8),
           ),
           onPressed:(){

             SpinKitRotatingCircle(
               color: Colors.black,
               size: 30.0,
             );
           }
         ),
     );

     //去评价
     var evaluteBtn = Container(
       width: adpWidth(74),
       height: adpHeight(28),
       margin: EdgeInsets.only(left: adpWidth(10)),
       child: OutlineButton(
           child: Text('去评价',style: TextStyle(color:hex88afd5(),fontSize: 13)),
           borderSide: BorderSide(
             color:hex88afd5(),
             width: adpWidth(0.8),
           ),
           onPressed:(){
             print('点击 去评价');
           }
          ),
     );

     switch(this.orderStatus) {
       case 1:{
           button.add(payBtn);
         }break;
       case 2:{
         button.add(againBtn);
           button.add(evaluteBtn);

         }break;
       case 3:{
           button.add(againBtn);
         }break;
     }

     return button;
   }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onPress == null ? (){} : onPress(),
      child: Container(
        color: Colors.white,
        height: adpHeight(160),
        margin: EdgeInsets.symmetric(vertical: adpHeight(10)),
        padding: EdgeInsets.symmetric(horizontal: adpWidth(15)),
        child: Column(
          children: <Widget>[
            //订单编号、状态
            Container(
              height: adpHeight(39),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(this.orderNum,style: TextStyle(color:hexa6a6a6(),fontSize: 13)),
                  statusText(),
                ],
              ),
              decoration: BoxDecoration(
                border: borderBottom(),
              ),
            ),
            //地址、日期
            Container(
              margin: EdgeInsets.only(top: adpWidth(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width:adpWidth(200),
                    child: Text(this.address,
                                style: TextStyle(color:hex383838(),fontSize:15,fontWeight: FontWeight.bold ),
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(this.time,style: TextStyle(color:hexa6a6a6(),fontSize:12,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            //商品名称
            Container(

              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: adpHeight(3)),
              child: Text('卡布奇诺咖啡 共1件商品',style: TextStyle(color:hex505050(),fontSize: 13),),
            ),

            //价格
            Container(
              margin: EdgeInsets.only(top: adpHeight(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('￥ ${this.price}',style: TextStyle(color: hex383838(),fontSize:14,fontWeight: FontWeight.bold)),
                  Row(children: buttons()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

//  const OrderListRow({ Key key }) : super(key: key);

}

