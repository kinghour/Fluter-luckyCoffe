
import 'package:flutter/material.dart';
import 'package:luckycoffe/pages/shopCar/pages/shopCar.dart';
import 'package:oktoast/oktoast.dart';
import '../../common/macros.dart';
import 'package:luckycoffe/common/customAppbar.dart';
import 'package:luckycoffe/pages/order/payItem.dart';
import 'package:luckycoffe/common/loadingDialog.dart';

import '../../common/macros.dart';

class PaySelectList extends StatefulWidget {
  @override
  _PaySelectListState createState() => _PaySelectListState();
}

class _PaySelectListState extends State<PaySelectList> {

  int selectValue = 0;
  bool isReaded = false;

  selectState( int value){
    print('点击了$value');
    setState(() {
      this.selectValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustAppBar(
        context,
        title: '支付中心',
        isShowBackButton: true,
      ),
      body: ListView(
        //选择列表
        children: <Widget>[

          Container(
            height: adpHeight(30),
            color: rgba(231, 241, 245, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //倒计时
                Text.rich(TextSpan(text:'',children: [
                  TextSpan(
                    text:'请在',
                    style: TextStyle(color: hex383838(),fontSize: 13),
                  ),
                  TextSpan(
                    text:'4分32秒',
                    style: TextStyle(color: hex88afd5(),fontSize: 13),
                  ),
                  TextSpan(
                    text:'内完成支付，过时订单将会取消。',
                    style: TextStyle(color: hex383838(),fontSize: 13),
                  ),
                ])),
              ],
            ),
          ),

          Container(
            color: Colors.white,
            child: PayItem('微信支付', 'order/weixinzhifu.png',value: 0,selectValue: this.selectValue,onPress: ()=> selectState(0)),
          ),
          Container(
            color: Colors.white,
            child: PayItem('支付宝支付', 'order/zhifubao.png',value: 1,selectValue: this.selectValue,onPress: ()=> selectState(1)),
          ),
          Container(
            color: Colors.white,
            child: PayItem('银联支付', 'order/yinlian.png',value: 2,selectValue: this.selectValue,onPress: ()=> selectState(2)),
          ),


          //支付协议
          Container(
            padding: EdgeInsets.all(adpWidth(5)),
            child: Row(
              children: <Widget>[
                SizedBox(width: adpWidth(5)),
                IconButton(
                    icon: Image.asset(this.isReaded == true ?imagePath('order/gouxuan.png'):imagePath('order/unfouxuan.png'),width: adpWidth(16),height: adpWidth(16),),
                    onPressed: (){
                      setState(() {
                        this.isReaded = !this.isReaded;
                      });
                    }
                ),
                InkWell(
                  child:Text.rich(TextSpan(text:'',children: [
                    TextSpan(
                      text:'我已阅读并同意',
                      style: TextStyle(color: hex808080(),fontSize: 13),
                    ),
                    TextSpan(
                      text:'《支付协议》',
                      style: TextStyle(color: hex88afd5(),fontSize: 13),
                    ),

                  ])),
                  onTap: (){
                    setState(() {
                      this.isReaded = !this.isReaded;
                    });

                  },
                ),
              ],
            ),
          ),

          //确认支付
          Container(
            margin: EdgeInsets.only(left: adpWidth(30),right: adpWidth(30),top: adpWidth(10)),
            height: adpHeight(45),
            child:RaisedButton(
                elevation: 0,
                color: hexColor('#90c0ef'),
                child: Text('确定支付',style:TextStyle(color: Colors.white,fontSize: 16)),
                onPressed:(){

                  print(isReaded);

                  if(!this.isReaded){
                    showToast('请确认您已经阅读支付协议');
                    return;
                  }
                  //加载动画
                  LoadingDialog.showProgress(context);
                  //延时执行、延时操作
                  Future.delayed(Duration(seconds: 2),(){
                    LoadingDialog.dismiss(context);
                    showToast('支付成功');
                    ///pop回指定的页面 '/'：是四个一节界面的承载者
                    Navigator.popUntil(context,  ModalRoute.withName('/'));

                  });

                }),
          ),

        ],
      ),
    );
  }
}





void lats(){
  print('11111');
}
