import 'package:flutter/material.dart';
import 'package:luckycoffe/common/customAppbar.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/pages/home/selectType.dart';
import 'package:luckycoffe/pages/shopCar/widget/switch.dart';
import 'package:oktoast/oktoast.dart';

class CofirmOrderPage extends StatefulWidget {
  @override
  _CofirmOrderPageState createState() => _CofirmOrderPageState();
}

class _CofirmOrderPageState extends State<CofirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustAppBar(context, title: '确认订单', isShowBackButton: true),
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            time(),
            Divider(
                height: adpHeight(10),
                thickness: adpHeight(10),
                color: hexf8f8f8()),
            address(),
            Divider(
                height: adpHeight(1),
                thickness: adpHeight(1),
                color: hexf8f8f8()),
            orderInfo(),
            Divider(
                height: adpHeight(1),
                thickness: adpHeight(1),
                color: hexf8f8f8()),
            totalPrice(),
            Expanded(child:Container(
              color: hexf8f8f8(),
            )),

            pay(context),
          ],
        ),
      )),
    );
  }
}

///取餐时间
time() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: adpWidth(15)),
    height: adpHeight(80),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SwitchSelect(),
        Spacer(),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loadText(
                  text: '立即取餐',
                  color: hex383838(),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
              Row(
//               mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text.rich(TextSpan(text: '', children: [
                    TextSpan(
                      text: '约 ',
                      style: TextStyle(color: hex808080(), fontSize: 11),
                    ),
                    TextSpan(
                      text: '18：16',
                      style: TextStyle(
                          color: hex88afd5(),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: ' 可取',
                      style: TextStyle(color: hex808080(), fontSize: 11),
                    ),
                  ]))
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}

///地址
address() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: adpWidth(15)),
    height: adpHeight(90),
    child: Row(
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              loadText(
                  text: '自提门店',
                  color: hex383838(),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
              SizedBox(
                height: adpHeight(15),
              ),
              loadText(
                  text: '青年汇店(No.1795)',
                  color: hex383838(),
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
              loadText(
                  text: '朝阳区朝阳北路青年汇102号楼一层123室',
                  color: hex383838(),
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ],
          ),
        ),
        Spacer(),
        loadImageAsset(
            imgPath: '/shopCar/jiantou.png',
            width: adpWidth(12),
            height: adpWidth(12)),
      ],
    ),
  );
}

///订单信息
orderInfo() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: adpWidth(15)),
    height: adpHeight(90),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        loadText(
            text: '订单信息',
            color: hex383838(),
            fontSize: 13,
            fontWeight: FontWeight.w600),
        SizedBox(
          height: adpHeight(15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                loadText(
                    text: '标准美式',
                    color: hex383838(),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                loadText(
                  text: '大/单份糖/单份奶/热',
                  color: hex383838(),
                  fontSize: 12,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: adpWidth(80)),
                  child: loadText(
                    text: 'x1',
                    color: hex383838(),
                    fontSize: 12,
                  ),
                ),
                loadText(
                    text: '￥22.0',
                    color: hex383838(),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)
              ],
            ),
          ],
        )
      ],
    ),
  );
}

///合计
totalPrice() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: adpWidth(15)),
    height: adpHeight(49),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        loadText(
          text: '合计 ',
          color: hex383838(),
          fontSize: 13,
        ),
        loadText(
            text: '￥22.0',
            color: hex383838(),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ],
    ),
  );
}

///支付栏
pay(BuildContext context) {
  return Container(
    color: Colors.white,
    height: adpHeight(60),
    padding: EdgeInsets.symmetric(horizontal: adpWidth(0)),
    child: Row(
      children: <Widget>[
        SizedBox(width: adpWidth(10),),
        loadText(
            text: '还需支付',
            color: hex383838(),
            fontSize: 12,
            fontWeight: FontWeight.w500),
        SizedBox(width: adpWidth(10)),
        loadText(
            text: '￥ 22.0',
            color: hex383838(),
            fontSize: 24,
            fontWeight: FontWeight.w600),
        Spacer(),
        InkWell(
          child: Container(
            width: adpWidth(119),
            color: hex88afd5(),
            alignment: Alignment.center,
            child:loadText(text:'去支付',color: Colors.white,fontWeight: FontWeight.w600) ,
          ),
          onTap: (){
            Navigator.pushNamed(context, '/PaySelectList');
          },
        )
      ],
    ),
  );
}
