import 'package:flutter/material.dart';
import 'package:luckycoffe/common/customAppbar.dart';
import 'package:luckycoffe/common/httpRequst/dioUtils.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/pages/menu/widget/product.dart';
import 'package:luckycoffe/pages/shopCar/model/remandModel.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCarModel.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCartData.dart';
import 'package:luckycoffe/pages/shopCar/widget/productBarWidget.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';
import '../model/counterModle.dart';
import '../model/remandModel.dart';
import '../widget/remand.dart';

class ShopCarPage extends StatefulWidget {
  @override
  _ShopCarPageState createState() => _ShopCarPageState();
}

class _ShopCarPageState extends State<ShopCarPage> {

  RemandModel _remandModel;

  @override
  void initState() {

   super.initState();

  }

 List<Widget> productList(Map<String,dynamic> dataMap,ShopCarModel shopCarModel){

    List<Widget> shopCarList = [];

    dataMap.keys.forEach((String key) {
      ShoppCartData data = dataMap[key];
      shopCarList.add(
        ProductBarWidget(
          id: data.id.toString(),
          title: data.name,
          price: data.price.toString(),
          nums: data.number,
          formate: data.specName,
          removeAction: (String id){
            setState(() {
              shopCarModel.remove(id);
            });
          },
          addAction: (String id,int num){
            shopCarModel.data.values.forEach((ShoppCartData data) {

              if(id == data.id.toString()){

                setState(() {
                  data.number = num;
//                  data.price = data.price * num;
                  shopCarModel.change(id, data: data);
                });
              }
            });

          },
        )
      );
    });

    return shopCarList;
  }


  @override
  Widget build(BuildContext context) {
    //在页面里初始化Provider,（不要在main文件里操作）

    //从provider获取全局数据
   ShopCarModel shopCarModel = Provider.of<ShopCarModel>(context);
   Map<String,dynamic> dataMap = shopCarModel.data;

   double totalPrice = 0;
   shopCarModel.data.values.forEach((ShoppCartData data) {
     totalPrice = totalPrice + data.price * data.number;
   });

    return Scaffold(
      appBar: CustAppBar(context,title: '购物车'),
      body:Container(
//        color: randColor(),
        child: Column(
          children: <Widget>[
            ///此处必须加Expaned 否则SingleChildScrollView不可上下滑动
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(bottom: adpHeight(60)),
                  child: Column(
                    children: <Widget>[
                      ///顶部图片
                      InkWell(
                        child:Container(
                          child: loadImageAsset(imgPath:'/shopCar/headImage.png',
                              width:screenW(),height: adpHeight(67)),
                        ),
                      ),

                      ///商品列表
                      Container(
                        child: Column(
                          children: productList(dataMap,shopCarModel),
                        ),
                      ),

                      ///猜你喜欢
                      RamandWidget(),

                    ],
                  ),
                ),
              ),
            ),

            ///去结算
            Container(
              width: screenW(),
              height: adpHeight(60),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(width: adpWidth(15)),
                  loadText(text: '应付合计',color: hex383838(),fontSize:14,fontWeight: FontWeight.bold),
                  SizedBox(width: adpWidth(3),),
                  Expanded(
                      child:loadText(text: '￥${shopCarModel.totalPrice}',color: hex383838(),fontSize:24,fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      width: adpWidth(119),
                      height: adpHeight(60),
                      color: hex88afd5(),
                      child:loadText(text:'去结算',color:Colors.white,fontSize:18),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, '/CofirmOrderPage');
                      print('点击了结算');
                    },
                  )
                ],
              ),
            )
          ],
        ) ,
      ),
    );
  }
}

class HomePagesec extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePagesecState();
}

class _HomePagesecState extends State<HomePagesec> {
  @override
  Widget build(BuildContext context) {
    CounterModel counter = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("第二页"),
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.red),
      ),
    );
  }
}
