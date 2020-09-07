

import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';

class CustAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final BuildContext context;
  final Function onPress;
  final brightness;


  final fontSize = 18.0;  //导航标题字体大小
  final titleColor = Colors.black;   //导航标题字体颜色
  final navBarBackColor = Colors.white;

  bool  isShowBackButton;   //是否隐藏返回按钮

  CustAppBar(this.context,{
    this.title,
    this.onPress,

    this.isShowBackButton = false,
    this.brightness = Brightness.light,

  });

  //因为自定义appbar需要继承PreferredSizeWidget，继承后还要实现get preferredSize方法
  @override
  Size get preferredSize => new Size.fromHeight(MediaQuery.of(context).size.height * 0.05);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
            child: AppBar(
              title: Text(this.title,
                          style: TextStyle(color:Colors.black,fontSize: this.fontSize,fontWeight: FontWeight.w500)),
              elevation: 0.5,
              centerTitle: true,
              backgroundColor: this.navBarBackColor,
              brightness: this.brightness,
              leading:this.isShowBackButton == true ? IconButton(icon: Image.asset(imagePath('back.png'),width: adpWidth(15),height: adpWidth(15),),
                onPressed: () =>  Navigator.of(context).pop() ,
              ):null,
//              bottom: PreferredSize(
//               child: Container(
//                 height: adpHeight(0.5),
//                 color: hexf2f2f2(),
//               ),
//             ),
            ),
            preferredSize: preferredSize);
  }
}
