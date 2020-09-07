import 'package:flutter/material.dart';
import '../../common/macros.dart';

class LoginType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
//          mainAxisSize: MainAxisSize.min,
          children: <Widget>[

            /// back按钮
            Container(

              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: adpWidth(10), top: adpWidth(36)),
              width: screenW(),
              height: adpWidth(36),
              child: IconButton(
                  icon: Image.asset(imagePath('back.png')),
                  onPressed: () => Navigator.of(context)..pop()),
            ),

            ///log
            Container(
              width: adpWidth(80),
              height: adpHeight(94),
              margin: EdgeInsets.only(top: adpHeight(45)),
              child: Image.asset(imagePath('login/login_log.png')),
            ),

            SizedBox(height: adpHeight(100),),

            ///登录按钮
            Container(
              width: adpWidth(300),
              height: adpHeight(44),
              child: FlatButton(
                child:Text('微信登录一键登录',style: TextStyle(color: Colors.white,fontSize: 16),),
                color: hexColor('#49c265'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                onPressed: (){
                  print('点击了微信登录');
                },
              ),
            ),

            SizedBox(height: adpHeight(25),),

            Container(
              width: adpWidth(300),
              height: adpHeight(44),
              child: OutlineButton(
                child: Text('手机验证码登录',style: TextStyle(color: hexColor('#88afd5'),fontSize: 16),),
                borderSide: BorderSide(color: hexColor('#88afd5'),width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                onPressed: (){
                  print('点击了手机验证码登录');

                  Navigator.pushNamed(context, '/fillPhone',
                      arguments: 'woshititle').then((value) => {
                        print(value)
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
