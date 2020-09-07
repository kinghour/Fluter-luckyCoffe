import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luckycoffe/common/httpRequst/dioUtils.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/pages/menu/page/menuOrder.dart';
import 'package:luckycoffe/pages/shopCar/model/remandModel.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCarModel.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCartData.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import '../widget/remand_item.dart';


class RamandWidget extends StatefulWidget {

  RamandWidget({Key key}) : super(key: key);

  @override
  _RamandWidgetState createState() => _RamandWidgetState();
}

class _RamandWidgetState extends State<RamandWidget> {

  List<Widget> remandList = [];
  RemandModel _remandModel = RemandModel();

  loadRemand(BuildContext context) {

    int page = Random().nextInt(4);//生成0-4以内随机数

    Map<String , dynamic> para = {
      "orderBy": 'ordersDown',
      "page": page,
      "pageSize": 3,
      "status": 0,
    };

//    showLoading(widget.superContext);
    DioUtils.postHttp('/shop/goods/list',
        parameters: para,
        onSuccess: (data) {
//          hidLoading(widget.superContext);
          RemandModel model = RemandModel.fromJson(data);
          setState(() {
            _remandModel = model;
          });

          print('');
        },
        onError: (error) {
          hidLoading(context);
          print('');
        });
  }

  @override
  void initState() {

    super.initState();
    loadRemand(context);

  }

  @override
  Widget build(BuildContext context) {

    ShopCarModel shopCarModel = Provider.of<ShopCarModel>(context);

    print('');


    return ChangeNotifierProvider(
      create: (_) => _remandModel,
      child:Container(
        child:Column(
          children: <Widget>[
            SizedBox(height: adpHeight(29)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: adpWidth(15)),
              width: screenW(),
              child: Row(
                children: <Widget>[
                  Container(
                    child: loadText(text:'猜你喜欢',color: hex383838(),fontSize:15,fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  InkWell(
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          loadImageAsset(imgPath:'/shopCar/load.png',width: adpWidth(12),height: adpWidth(12)),
                          SizedBox(width: adpWidth(5),),
                          loadText(text:'换一批',color: hex88afd5(),fontSize: 12),
                        ],
                      ),
                    ),
                    onTap: (){
                      _remandModel.data = null;
                      loadRemand(context);
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: adpHeight(10)),
            ///猜你喜欢
            Container(
              margin: EdgeInsets.symmetric(horizontal: adpWidth(15)),
              width: screenW(),
              child: Consumer(builder:(BuildContext  context,RemandModel remandModel,Widget child){
                return _remandModel.data == null ? Container(): Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:remandListRow(context,_remandModel,shopCarModel),
                );
              }),

            ),
          ],
        ) ,
      ) ,
    );
  }
}


remandListRow(BuildContext context,RemandModel model,ShopCarModel shopCarModel){

  List <Widget> list = [];
  model.data.forEach((RemandItemModel model) {
    list.add(
        RemandItem(
         imgUrl: model.pic,
         title: model.name,
         desc: model.characteristic,
         price: model.minPrice.toString(),
         originPrice: '38',
          addAction: (){

            ///点击 + 选购商品
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Dialog(
                    insetPadding:
                    EdgeInsets.all(0), //取消默认的padding边距
                    backgroundColor: Colors.white
                        .withOpacity(0), //背景色可以设置透明
                    child: MenuOrderPage(
                        id:model.id.toString(),carModel:shopCarModel),
                  );
                });
          },
       )
    );
  });
  return list;
}
