import 'package:flutter/material.dart';

import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/pages/menu/widget/caculateWidget.dart';
import 'package:luckycoffe/pages/shopCar/model/shopCarModel.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';


/// * 快速创建dart界面模板,省去手敲stful、stleees

class ProductBarWidget extends StatefulWidget {

  final String  id;
  final String title;
  final String formate;
  final String price;
  final int nums;
  final Function press;
  final Function(String id) removeAction;
  final Function addAction;

  const ProductBarWidget({Key key, this.title, this.formate, this.price, this.nums,this.press, this.id, this.removeAction, this.addAction}) : super(key: key);

  @override
  _ProductBarWidgetState createState() => _ProductBarWidgetState();
}

class _ProductBarWidgetState extends State<ProductBarWidget> {



  @override
  Widget build(BuildContext context) {

    ShopCarModel shopCarModel = Provider.of<ShopCarModel>(context);

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          InkWell(
            child: Container(
              color: Colors.white,
//            decoration: BoxDecoration(),
              height: adpHeight(80),
              margin: EdgeInsets.symmetric(horizontal: adpWidth(15)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //勾选图标
                  Container(
                    child:loadImageAsset(
                        imgPath: '/order/ziyuan.png',
                        width: adpWidth(16),
                        height: adpWidth(16)) ,
                  ),

                  //标题
                  Container(
                    margin: EdgeInsets.only(left: adpWidth(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              loadText(
                                  text: widget.title,
                                  color: hex383838(),
                                  fontSize:14,
                                  fontWeight: FontWeight.w600),
                              SizedBox(width: adpWidth(4),),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.all(Radius.circular(adpHeight(2))),
                                  color: hexWithColor('#ff8102'),
                                ),
                                alignment: Alignment.center,
                                width: adpWidth(32),
                                height: adpHeight(14),

                                child: loadText(text: '买2赠1',color: Colors.white,fontSize: 10,),

                              )
                            ],
                          ),
                        ),
                        loadText(
                            text: widget.formate,
                            color: hex383838(),
                            fontSize: 12),
                        loadText(
                            text: '仅限打包带走',
                            color: hexWithColor('#557a9d'),
                            fontSize: 12),
                      ],
                    ),
                  ),

                  //价格
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: adpWidth(2)),
                      child: loadText(
                          text:'￥ ${widget.price}',
                          color: hex383838(),
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  //计数器
                  CaculateWidget(
                    jianImg: '/shopCar/shopCar_jianhao.png',
                    num: widget.nums,
                    miniNum: 0,
                    caculateAction: (int num) {
                      if(num == 0){
                        widget.removeAction(widget.id);
                        showToast('删除成功');
                      }else{
                        widget.addAction(widget.id,num);
                      }

                      print('当前num $num');
                    },
                  ),
                ],
              ),
            ),
            onTap: () {
              //函数回调注意调用方法的时候 方法名+()
              widget.press();
            },
          ),
          Container(
            margin: EdgeInsets.only(left: adpWidth(46), right: adpWidth(15)),
            child: Divider(height: 1),
          )
        ],
      ),
    );
  }
}
