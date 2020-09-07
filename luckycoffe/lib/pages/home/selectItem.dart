
import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/common/global.dart';

class SelectItem extends StatelessWidget {

  final String title;
  final String desc;
  final String imgPath;
  final int index;
//  final Function onPressed;

  SelectItem({Key key,this.title,this.desc,this.imgPath,this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onpressWithIndex();
      },
      child: Container(
        height: adpHeight(65),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 2,color: rgba(242, 242, 242, 1))),
        ),
        margin:EdgeInsets.only(left: adpWidth(10),right: adpWidth(20)),
        child: Row(

          children: <Widget>[
            Container(
              //标题
              height: adpWidth(50),
              alignment: Alignment.centerLeft,
              child: leftChild(title, desc),
            ),
            Flexible(flex: 1,child: Container()),
            Container(//右侧图标
              width: adpWidth(45),
              height: adpWidth(45),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(adpWidth(22.5)),
                  border: Border.all(
                    color: hexColor('#64443c'),
                    width: 1,
                  )
              ),
              padding: EdgeInsets.all(10),
              child: Image.asset(
                this.imgPath,
                alignment: Alignment.centerRight,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }

  Column leftChild(String title, String desc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Text(title, style: TextStyle(color: rgba(56, 56, 56, 1), fontSize: 16, fontWeight: FontWeight.bold,)),

        Text(desc, style: TextStyle(color: rgba(128, 128, 128, 1), fontSize: 12))
      ],
    );
  }
  
  onpressWithIndex(){
    switch(this.index){
      case 0:{
       print('点击了 第1个');
      }break;
      case 1:{
        print('点击了 第2个');
      }break;
      case 2:{
        print('点击了 第3个');
      }break;
      case 3:{
        print('点击了 第4个');
      }break;
      default:{

      }
    }


  }
}
