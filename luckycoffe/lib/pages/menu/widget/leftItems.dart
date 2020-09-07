
import 'package:flutter/material.dart';
import '../../../common/macros.dart';
import 'package:luckycoffe/models/menuModel.dart';
import '../Model/leftClassModel.dart';

// ignore: must_be_immutable
class LeftItems extends StatelessWidget{

  final Function onPress;
  final int seletcId;
  final List<ClasesModel> modelList;

  LeftItems(this.modelList,{Key key,this.onPress, this.seletcId}) : super(key: key);


  List <Widget> render (){

    List <Widget> widgetList = [];
    this.modelList.forEach((clasesModel) {

      widgetList.add(
        Container(

          width: adpWidth(90),
          height: adpHeight(44),
          decoration: BoxDecoration(
            border: Border(left:BorderSide(color:this.seletcId == clasesModel.id ? hex88afd5():hexffffff(), width: adpWidth(5)),),
            color:this.seletcId == clasesModel.id ? hexffffff() : rgba(248, 248, 248, 1),
          ),
          child: InkWell(
            child: Center(
              child: Text(clasesModel.name,style: TextStyle(color:hex383838(),fontSize: 16,fontWeight: FontWeight.w500)),
            ),
            onTap:() => this.onPress(clasesModel),
          ),
        )
      );
    });
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: this.modelList == null ? List():render(),
    );
  }
}



