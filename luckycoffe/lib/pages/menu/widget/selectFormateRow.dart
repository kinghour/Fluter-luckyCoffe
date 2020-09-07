import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/pages/menu/Model/detailModel.dart';
import 'formateRow.dart';

class SelectFormateRow extends StatefulWidget {

  final DetailModel model;

  const SelectFormateRow({
    Key key,
    this.model,
  }) : super(key: key);
  @override
  _SelectFormateRowState createState() => _SelectFormateRowState();
}

class _SelectFormateRowState extends State<SelectFormateRow> {


  List<Widget> propertyList = [];

  @override
  void initState() {

    //规格
    widget.model.data.properties.forEach((Property property) {
      this.propertyList.add(FormateRow(property:property,selectCall: (String name){

        print('点击规格标题 $name');
      }));
    });
    //分割线
    this.propertyList.add(Divider(height: 1));
    //商品描述
    this.propertyList.add(descRow(widget.model.data.content));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: adpWidth(335),
        padding: EdgeInsets.only(top: adpHeight(20)),
        height: adpHeight(310),
        child: SingleChildScrollView(
          child: Column(
            children: this.propertyList,
          ),
        ));
  }
}


descRow(String content) {
  String desc = content
      .replaceAll(RegExp("<.*?p>"), "")
      .replaceAll(RegExp('\\\\n'), '\n');

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: EdgeInsets.only(left: adpWidth(15), top: adpHeight(10)),
        child: Text('商品描述', style: TextStyle(color: hex383838(), fontSize: 14)),
      ),
      SizedBox(height: adpHeight(8)),
      Container(
        margin: EdgeInsets.symmetric(horizontal: adpWidth(15)),
        child: Text(desc, style: TextStyle(color: hex383838(), fontSize: 12)),
      )
    ],
  );
}
