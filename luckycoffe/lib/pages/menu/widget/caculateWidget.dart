import 'package:flutter/material.dart';
import '../../../common/macros.dart';


//typedef caculateAction<T> = void Function(value);


// ignore: must_be_immutable
class CaculateWidget extends StatefulWidget {

  int num;
  int miniNum ;
  int maxNum;
  String jianImg;
  String jiaImg;
  Function(int num) caculateAction;

  CaculateWidget({Key key,this.num = 0,
    this.miniNum = 0,
    this.maxNum = 999,
    this.caculateAction,
    this.jiaImg = '/menu/jiahao.png',
    this.jianImg = '/menu/jianhao.png',
    }) : super(key: key);

  @override
  _CaculateWidgetState createState() => _CaculateWidgetState();

}

class _CaculateWidgetState extends State<CaculateWidget> {

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          /// 减
          IconButton(
              icon: Image.asset(
                imagePath(widget.jianImg),
                width: adpWidth(20),
                height: adpWidth(20),
              ),
              onPressed: () {
                if(widget.num > widget.miniNum){
                  setState(() {
                    widget.num -= 1;
                    widget.caculateAction(widget.num);
//                    print('当前num ${widget.num}');
                  });
                }
              }),
          Container(
            alignment: Alignment.center,
            width: adpWidth(20),
            child: loadText(
                text: widget.num.toString(), color: hex383838(), fontSize: 12),
          ),
          IconButton(
            icon: Image.asset(
              imagePath(widget.jiaImg),
              width: adpWidth(20),
              height: adpWidth(20),
            ),
            ///加
            onPressed: () {
              setState(() {
                widget.num += 1;
                widget.caculateAction(widget.num);

              });
            },
          ),
        ],
      ),
    );
  }
}
