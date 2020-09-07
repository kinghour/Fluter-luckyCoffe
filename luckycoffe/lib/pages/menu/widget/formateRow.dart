
import 'package:flutter/material.dart';
import '../../../common/macros.dart';
import 'package:luckycoffe/pages/menu/Model/detailModel.dart';


class FormateRow extends StatefulWidget {

  final Property property;

  Function(String name) selectCall;

  FormateRow({Key key, this.property,this.selectCall}) : super(key: key);

  @override
  _FormateRowState createState() => _FormateRowState();

}

class _FormateRowState extends State<FormateRow> {

  List<Widget> propertyList = [];
  
  int _selectTag = 0;

  //调用页面中的函数体
  myselect(int i,String name) {
//    print('选择了....' + i.toString());

    widget.selectCall(name);

    if(_selectTag == i){
      return;
    }else{
      setState(() {
        _selectTag = i;
      });
    }
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: adpHeight(15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //标题
          Container(
            alignment: Alignment.centerLeft,
            width: adpWidth(60),
            height: adpHeight(30),
            padding: EdgeInsets.only(left: adpWidth(15)),
            child: Text(widget.property.name,
                    style: TextStyle(
                      color: hex383838(),
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
          ),
          //规程参数
          Container(
            width: adpWidth(335) - adpWidth(60),
            child: Wrap(//流布局
              children: List.generate(widget.property.childsCurGoods.length, (i) {
                return Container(
                  margin: EdgeInsets.fromLTRB(5, 0, 5, 5),
                  height: adpHeight(30),
                  width: adpWidth(80),
                  child: formateItem(
                      textColor:_selectTag == i ?Colors.white :hexWithColor('#ccc0b4'),
                      titleName: widget.property.name,
                      name:widget.property.childsCurGoods[i].name,
                      selectTag: i,
                      tapCall: myselect,
                      backColor:_selectTag == i ? hexWithColor('#ccc0b4'):Colors.white),

                );
              }),
            ),
          )
        ],
      ),
    );
  }
}



InkWell formateItem({

  String name,
  String titleName,
  int selectTag,
  Function(int seletcTag,String name) tapCall,
  Color textColor,
  Color backColor,

}){

  return InkWell(
    child: Container(
      width: adpWidth(80),
      height: adpHeight(30),
      child: Center(
        child: Text(name,
            style: TextStyle(color: textColor, fontSize: 14)),
      ),
      decoration: BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(adpHeight(15))),
        border: Border.all(width: 1, color: hexWithColor('#ccc0b4')),
        color: backColor,
      ),
    ),
    onTap: () {
      tapCall(selectTag,titleName);
    },
  );
}