import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';

class ClassifyTitle extends StatelessWidget {
  final String title;
  final String desc;

  ClassifyTitle({Key key, this.title, this.desc}) : super(key: key);

  //不含描述内容
  noDescTitle() {
    return Container(
      height: adpHeight(44),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(this.title,
                style: TextStyle(
                    color: hex383838(),
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          Expanded(
              child: Container(
            margin: EdgeInsets.only(right: adpWidth(20), left: adpWidth(10)),
            height: adpHeight(1),
            color: hexf2f2f2(),
          ))
        ],
      ),
    );
  }

  descTitle() {
    return Container(
      height: adpHeight(44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(this.title,
                  style: TextStyle(
                      color: hex383838(),
                      fontSize: 14,
                      fontWeight: FontWeight.w600))),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: adpWidth(10)),
                child: Text(this.desc,
                    style: TextStyle(
                        color: hexWithColor('#a6a6a6'), fontSize: 12)),
              ),
              Expanded(
                  child: Container(
                margin:
                    EdgeInsets.only(right: adpWidth(10), left: adpWidth(10)),
                height: adpHeight(1),
                color: hexf2f2f2(),
              ))
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.desc == null ? noDescTitle() : descTitle();
  }
}
