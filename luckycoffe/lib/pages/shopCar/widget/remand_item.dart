import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:oktoast/oktoast.dart';

class RemandItem extends StatelessWidget {

  final String imgUrl;
  final String title;
  final String desc;
  final String price;
  final String originPrice;
  final Function addAction;

  RemandItem(
      {Key key,
        this.imgUrl,
        this.title,
        this.desc,
        this.price,
        this.originPrice, this.addAction})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: adpWidth(108),
      height: adpHeight(180),
      color: Colors.white,
//      margin: EdgeInsets.symmetric(horizontal: adpWidth(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: adpWidth(108),
            height: adpWidth(108),
            child: loadImageNet(this.imgUrl,fit: BoxFit.cover),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: adpWidth(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                loadText(
                    text: this.title,
                    color: hex383838(),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
                Container(
                  margin: EdgeInsets.only(top: adpHeight(2)),
                  child: loadText(
                      text: this.desc,
                      color: hexa6a6a6(),
                      fontSize: 11,
                      maxLines: 1,
                      ),
                ),
              ],
            ),
          ),

          Container(
            width: adpWidth(108),
            margin:EdgeInsets.only(left: adpWidth(5),right: adpWidth(5),top: adpHeight(15)),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                loadText(
                    text: '￥${this.price}',
                    color: hexWithColor('#ff8d1a'),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
                Container(
                  child: loadText(
                      text: '￥${this.originPrice}',
                      color: hexa6a6a6(),
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      textDecoration: TextDecoration.lineThrough),
                ),

                InkWell(
                  child: loadImageAsset(
                    imgPath: '/menu/jiahao.png',
                    width: adpWidth(24),
                    height: adpWidth(24),
                  ),
                  onTap: (){
                    this.addAction();
                  },
                )
              ],
            ) ,
          )
        ],
      ),
    );
  }


}
