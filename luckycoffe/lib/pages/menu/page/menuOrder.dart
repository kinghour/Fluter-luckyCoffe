import 'package:flutter/material.dart';
import 'package:luckycoffe/common/httpRequst/dioUtils.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/pages/menu/widget/selectFormateRow.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCarModel.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCartData.dart';
import 'package:provider/provider.dart';
import '../widget/caculateWidget.dart';
import 'package:oktoast/oktoast.dart';

import '../../../common/macros.dart';
import '../Model/detailModel.dart';

import 'package:quiver/strings.dart';

class MenuOrderPage extends StatefulWidget {

  final String id;

  final ShopCarModel carModel;

  const MenuOrderPage({Key key, this.id, this.carModel}) : super(key: key);

  @override
  _MenuOrderPageState createState() => _MenuOrderPageState();
}

class _MenuOrderPageState extends State<MenuOrderPage> {

  DetailModel _detailModel;

  ShopCarModel _shopCarModel;

  @override
  void initState() {

    _shopCarModel = widget.carModel;

    super.initState();
    Future.delayed(Duration.zero, () {
      init(context);
    });

  }

  init(BuildContext context) async {
    showLoading(context);
    DioUtils.postHttp('/shop/goods/detail', parameters: {'id': widget.id},
        onSuccess: (data) {
      hidLoading(context);
      DetailModel detailModel = DetailModel.fromJson(data);
      setState(() {
        _detailModel = detailModel;
        print('');
      });
    }, onError: (error) {
      print('');
    });
  }

  @override
  Widget build(BuildContext context) {

    ShopCarModel model = Provider.of<ShopCarModel>(context);

    return _detailModel == null
        ? Container(
            width: adpWidth(335),
            height: adpHeight(580),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              color: Colors.white,
         )
        )
        : Container(
            width: adpWidth(335),
            height: adpHeight(580),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                //顶部
                imageHeader(context,_detailModel.data.basicInfo.name,_detailModel.data.basicInfo.characteristic),
                //规格选择
                SelectFormateRow(model: _detailModel),
                //价格计算
                priceNum(_detailModel.data.basicInfo,_detailModel.data.properties),
                //加入购车
                productBar(context,_detailModel,_shopCarModel),
//                collecProduct(),

              ],
            ),
          );
  }
}

///顶部title栏
imageHeader(BuildContext context,String title,String secTitle) {
  return Stack(
    children: <Widget>[
      Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.asset(
            imagePath('menu/menu_orderBanner.jpg'),
            width: adpWidth(335),
            height: adpHeight(150),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: adpWidth(10),
        right: adpWidth(10),
        child: IconButton(
            icon: Image.asset(imagePath('menu/shanchu.png'),
                width: adpWidth(25), height: adpWidth(25)),
            onPressed: () {
              Navigator.pop(context);
              print('点击了退出按钮');
            }),
      ),
      Positioned(
          left: adpWidth(15),
          bottom: adpHeight(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                secTitle,
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ))
    ],
  );
}

///规格选择栏
formatterSelect(DetailModel detailModel) {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[],
    ),
  );
}

_showDialog(BuildContext context) async {
  var result = await showDialog(
    context: context,
    builder: (ctx) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: Colors.red,
            )
          ],
        ),
      );
    },
  );

  print("result = $result");
}

///价格、数量计算

priceNum(BasicInfo bascInfo,List<Property> properts){

  if(bascInfo.currentPrice == null){
    bascInfo.currentPrice = bascInfo.minPrice;
  }

  String desc = '';
  Map <String , String> map  = Map();
  properts.forEach((Property property) {
    desc = desc + property.childsCurGoods.first.name + ' ';

//    map.addAll({property.name:property.childsCurGoods.first.name});
  });

  bascInfo.setTitle(desc);


  return ChangeNotifierProvider(
    create: (_)=>bascInfo,
    child: Container(
      decoration: BoxDecoration(
        border: Border(top:BorderSide(width: adpWidth(1),color: hexf2f2f2()),
            bottom: BorderSide(width:adpWidth(1),color: hexf2f2f2())),
      ),
      padding: EdgeInsets.symmetric(horizontal: adpWidth(15)),
      height: adpHeight(60),
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(builder: (BuildContext context,BasicInfo basicInfo,Widget child){
                return loadText(text:'￥'+basicInfo.currentPrice.toString(),color:hex383838(),fontSize:18,fontWeight: FontWeight.w600);
              }),
//底部规格标签栏  先搁置
//              Consumer(builder: (BuildContext context,BasicInfo basicInfo,Widget child){
//                return loadText(text: bascInfo.desc,color: hex383838(),fontSize: 12);
//              }),
//
            ],
          ),

          Spacer(),

          CaculateWidget(num: 1,miniNum: 1,caculateAction: (int num){
            double originPrice =  bascInfo.minPrice;
            print('当前num $num');
            bascInfo.setPrice( originPrice * num);
           },
          ),
        ],
      ),
    ),
  );

}


/// 订单操作栏
productBar(BuildContext context,DetailModel detailModel,ShopCarModel carModel){

  return Container(
    margin: EdgeInsets.only(top: adpHeight(14)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        loadMixButton(
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(adpHeight(5)),
              color: hexColor('#ff8102'),
            ) ,
            width: adpWidth(84),
            height: adpHeight(32),
            text: loadText(text: '充2赠1',color: Colors.white,fontSize: 12),
            image:loadImageAsset(imgPath:'/menu/money.png',width: adpWidth(16),height: adpWidth(16)),
            onPress: (){
              print('点击了充2赠1');
            }
        ),
        SizedBox(width: adpWidth(10)),
        loadMixButton(
            decoration:BoxDecoration(
              border: Border.all(width: adpWidth(1),color: hex88afd5()),
              color: rgba(136, 175, 213, 0.3),
            ) ,
            width: adpWidth(84),
            height: adpHeight(32),
            text: loadText(text: '收藏口味',color: hex88afd5(),fontSize: 12),
            image:loadImageAsset(imgPath:'/menu/heart.png',width: adpWidth(16),height: adpWidth(16)),
            onPress: (){
              showLoading(context);
              Future.delayed(Duration(seconds: 2),(){
                hidLoading(context);
                showToast('收藏成功');
                Navigator.pop(context);
              });
              print('点击了收藏');
            }
        ),
        SizedBox(width: adpWidth(10)),
        loadMixButton(
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(adpHeight(5)),
            color: hex88afd5(),
          ) ,
          width: adpWidth(84),
          height: adpHeight(32),
          text: loadText(text: '加入购物车',color: Colors.white,fontSize: 12),
          image:loadImageAsset(imgPath:'/menu/shopCar.png',width: adpWidth(16),height: adpWidth(16)),
          onPress: (){

            List<Property> properts = detailModel.data.properties;
            String desc = '';
            Map <String , String> map  = Map();
            properts.forEach((Property property) {
              desc = desc + property.childsCurGoods.first.name + ' ';

            });

            ShoppCartData data = ShoppCartData();
            data.id = detailModel.data.basicInfo.id;
            data.name = detailModel.data.basicInfo.name;
            data.price = detailModel.data.basicInfo.currentPrice;
            data.number = detailModel.data.basicInfo.minBuyNumber;
            data.specName = desc;

            carModel.add(data);
            print('点击了购物车');

            showLoading(context);
            Future.delayed(Duration(milliseconds: 1500),(){
              hidLoading(context);
              showToast('加入购物车成功');
              Navigator.pop(context);
            });
          }
        ),
      ],
    ),
  );
}