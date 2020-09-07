import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luckycoffe/pages/menu/page/menuOrder.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCarModel.dart';
import 'package:provider/provider.dart';

import '../../../common/macros.dart';
import '../Model/rightProductModel.dart';

class ProductWidget extends StatelessWidget {

  final ProductModel model;

  ProductWidget({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ShopCarModel shopCarModel = Provider.of<ShopCarModel>(context);

    return Container(
      width: screenW(),
      height: adpHeight(90),
      margin: EdgeInsets.only(top: adpHeight(10), bottom: adpHeight(0)),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: adpWidth(10)),
                  child: ClipRRect(
                    //image切圆角
                    borderRadius: BorderRadius.circular(adpHeight(4)),
                    child: Image.network(
                      model.pic,
                      width: adpWidth(70),
                      height: adpWidth(70),
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
//          color: Colors.blue,
                margin: EdgeInsets.only(left: adpWidth(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.model.name,
                      style: TextStyle(
                          color: hex383838(),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      this.model.characteristic,
                      style: TextStyle(
                          color: hexWithColor('#a6a6a6'), fontSize: 11),
                    ),
//              Text(
//                '默认：大/单糖/热',
//                style: TextStyle(color: hexWithColor('#a6a6a6'), fontSize: 11),
//              ),
                    SizedBox(height: adpHeight(20)),
                    Container(
                      width: adpWidth(180),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('￥ ${this.model.minPrice}',
                              style: TextStyle(
                                  color: hex383838(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                          Spacer(),
                          Container(
                            child: InkWell(
                              child: Image.asset(
                                imagePath('/menu/jiahao.png'),
                                width: adpWidth(22),
                                height: adpWidth(22),
                                fit: BoxFit.cover,
                              ),
                              onTap: () {
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
                                            id: this.model.id.toString(),carModel:shopCarModel),
                                      );
                                    });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                left: adpWidth(10), right: adpWidth(20), top: adpHeight(10)),
            child: Divider(
              height: 2,
            ),
          )
        ],
      ),
    );
  }

//  const ProductWidget({Key key, this.model}) : super(key: key);
}
