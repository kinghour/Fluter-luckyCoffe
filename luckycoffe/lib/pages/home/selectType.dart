
import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';

class SelectType extends StatefulWidget {
  @override
  _SelectTypeState createState() => _SelectTypeState();
}

class _SelectTypeState extends State<SelectType> {

  bool isGet = true; //默认自提
  var get = new Container();
  var send = new Container();

  @override
  Widget build(BuildContext context) {
    return Container(

      height: adpHeight(65),
      margin: EdgeInsets.only(left: adpWidth(7.5),right: adpWidth(7.5)),
      child: Row(
        children: <Widget>[
          address(),
          Spacer(),
          selectSwitch()
        ],
      ),
    );
  }

  //地址
  address(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('青年汇店',style: TextStyle(fontSize:15,color: hexColor('#383838'))),
        SizedBox(height: 3,),
        Text('距您58m',style: TextStyle(fontSize: 12,color: hexColor('#808080')),)
      ],
    );
  }

  //选择开关
  selectSwitch(){

    return Container(
      width: adpWidth(105),
      height: adpHeight(34),
      decoration: BoxDecoration(
        border: Border.all(color: hexColor('#88afd5'),width: 1),
        borderRadius: BorderRadius.circular(adpHeight(17))
      ),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          select('自提',this.isGet,1),

          select('外送',!this.isGet,2),

        ],
      ),
    );

  }

  select(String title,bool selected,int tag){

    return  GestureDetector(
      child: Padding(
        padding: tag == 1 ? EdgeInsets.only(left: adpWidth(1)):EdgeInsets.only(right: adpWidth(2)),
        child: Container(
          alignment: Alignment.center,
          width: adpWidth(50.0),
          height: adpHeight(30.0),
          decoration: BoxDecoration(
              color:selected ? hexColor('#88afd5') : Colors.white,
              borderRadius:BorderRadius.all(Radius.circular(adpHeight(15)))
          ),
          child: Text(
            title,
            style:TextStyle(color:selected ? Colors.white : hexColor('#88afd5'),fontSize: 12) ,
            textDirection:TextDirection.ltr ,

          ),
        ),
      ),
      onTap: (){
        setState(() {

          isGet = tag == 1? true:false;
        });
      },
    );
  }

}
