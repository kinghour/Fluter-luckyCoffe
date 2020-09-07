import 'package:flutter/material.dart';
import '../../common/macros.dart';

class SelectAreaPage extends StatelessWidget {

  const SelectAreaPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: <Widget>[
          SizedBox(height: statusH(),),
          /// back按钮
          Container(
            color: Colors.white,
            alignment: Alignment.bottomLeft,
            margin: EdgeInsets.only(left: adpWidth(0), top: adpWidth(0)),
            width: screenW(),
            height: adpWidth(44),
            child: IconButton(
                icon: Image.asset(
                  imagePath('back.png'),
                  width: adpWidth(20),
                  height: adpHeight(20),
                ),
                onPressed: () => Navigator.of(context)..pop()),
          ),

          Container(
            color: hexf2f2f2(),
            height: adpHeight(7),
          ),

          item(' 中国', '+86',context),
          Divider(
            indent: adpWidth(20),
            height: 0,
            thickness: 0.5,
          ),
          item(' 香港（中国）', '+852',context),
          Divider(
            indent: adpWidth(20),
            height: 0.5,
            thickness: 0.5,
          ),
          item(' 美国', '+1',context),

          Container(
            margin: EdgeInsets.all(0),
            color: hexf2f2f2(),
          ),


        ],
      ),
    );
  }



  item(String title, String nums,BuildContext context) {
    return GestureDetector(
      child: Container(

        color: Colors.white,
        height: adpHeight(50),
        padding: EdgeInsets.only(left: adpWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: hex383838(), fontSize: 16),
            ),
            Spacer(),
            Text(
              nums,
              style: TextStyle(color: hex383838(), fontSize: 16),
            ),
            SizedBox(
              width: adpWidth(20),
            )
          ],
        ),
      ),
      onTap: (){

        print('选择了区域  $title');
        Navigator.pop(context,title);
      },
    );
  }
}
