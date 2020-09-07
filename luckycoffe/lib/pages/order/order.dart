

import 'package:flutter/material.dart';
import 'package:luckycoffe/common/customAppbar.dart';
import 'package:luckycoffe/common/global.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/common/baseTabbar.dart';


import 'package:luckycoffe/common/titleBar.dart';
import 'package:luckycoffe/pages/order/orderListRow.dart';


class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

// 1.多继承 SingleTickerProviderStateMixin
class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  //2.声明tabs
  List<Widget> tabs = [
    Tab(
      text: '全 部',
    ),
    Tab(
      text: '未完成',
    ),
    Tab(
      text: '已完成',
    ),
  ];

  TabController _tabController;

  final Color bkgColor = Color.fromARGB(255, 237, 88, 84);

  @override
  void initState() {
    super.initState();
    //初始化controller并添加监听

    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustAppBar(context,title: '全部订单',isShowBackButton: false,),
      body: SafeArea(
          child: Column(
            children: <Widget>[
              BaseTabbar(
                tabs: tabs,
                tabController: _tabController,
              ),
              Flexible(
                child: TabBarView(
                  controller: _tabController,
                  children:<Widget>[
                    ///全部
                    ListView(
                      children: <Widget>[
                        OrderListRow(1,context,
                          orderNum: '外卖订单：RN123124134213',
                          address: '北京市朝阳区青年汇佳园10号',
                          time: '2019-01-08 09:05',
                          price: '12',
                          onPress:()=> print('点击了item 1'),
                        ),
                        OrderListRow(2,context,
                          orderNum: '外卖订单：RN123124134213',
                          address: '北京市朝阳区青年汇佳园10号',
                          time: '2019-01-08 09:05',
                          price: '12',
                          onPress:()=> print('点击了item 2'),
                        ),
                        OrderListRow(3,context,
                          orderNum: '外卖订单：RN123124134213',
                          address: '北京市朝阳区青年汇佳园10号',
                          time: '2019-01-08 09:05',
                          price: '12',
                          onPress:()=> print('点击了item 3'),
                        ),
                      ],
                    ),

                    ///未完成
                    ListView(
                      children: <Widget>[
                        OrderListRow(3,context,
                          orderNum: '外卖订单：RN123124134213',
                          address: '北京市朝阳区青年汇佳园10号',
                          time: '2019-01-08 09:05',
                          price: '12',
//                    onPress:()=> print('点击了item 3'),
                        ),
                      ],
                    ),

                    ///已完成
                    ListView(
                      children: <Widget>[
                        OrderListRow(2,context,
                          orderNum: '外卖订单：RN123124134213',
                          address: '北京市朝阳区青年汇佳园10号',
                          time: '2019-01-08 09:05',
                          price: '12',
//                    onPress:()=> print('点击了item 3'),
                        ),
                      ],
                    ),
                  ],
                ),
              )

            ],
          )
      ),
    );
  }
}
