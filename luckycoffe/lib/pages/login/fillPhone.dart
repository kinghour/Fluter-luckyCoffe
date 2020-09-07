import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../common/macros.dart';
import 'dart:async';
import '../login/downCountTimer.dart';
import 'package:oktoast/oktoast.dart';

/// * 快速创建dart界面模板,省去手敲stful、stleees

class FillPhonePage extends StatefulWidget {
  @override
  _FillPhonePageState createState() => _FillPhonePageState();
}

class _FillPhonePageState extends State<FillPhonePage> {
  String _phoneNum;
  String _codeValue;

  String title;
  String selectArea = ' 中国（+86）';

  @override
  Widget build(BuildContext context) {

    this.title =ModalRoute.of(context).settings.arguments;
    print('打印title == $title');

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            /// back按钮
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: adpWidth(10), top: adpWidth(36)),
              width: screenW(),
              height: adpWidth(36),
              child: IconButton(
                  icon: Image.asset(imagePath('back.png')),
                  onPressed: () => Navigator.pop(context, "我是回传的值") ),
//                  onPressed: () => Navigator.of(context)..pop()),
            ),

            ///log
            Container(
              width: adpWidth(80),
              height: adpHeight(90),
              margin: EdgeInsets.only(top: adpHeight(45)),
              child: Image.asset(imagePath('login/login_log.png')),
            ),

            SizedBox(
              height: adpHeight(40),
            ),

            GestureDetector(
              child: Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.only(left: adpWidth(40), right: adpWidth(40)),
                  height: adpHeight(50),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    width: 1,
                    color: hexColor('#f2f2f2'),
                  ))),
                  child: Row(
                    children: <Widget>[
                      Text.rich(TextSpan(text: '', children: [
                        TextSpan(
                          text: '选择国家/地区',
                          style: TextStyle(
                              fontSize: 14, color: hexColor('#808080')),
                        ),
                        TextSpan(
                            text: this.selectArea,
                            style: TextStyle(
                                fontSize: 14, color: hexColor('#383838'))),
                      ])),
                      Spacer(),
                      Image.asset(
                        imagePath('mine/minehead.png'),
                        width: adpWidth(12),
                        height: adpWidth(12),
                      ),
                      SizedBox(
                        width: adpWidth(20),
                      )
                    ],
                  )),
              onTap: () {

                Navigator.pushNamed(context, '/selectArea').then((value){
                  setState(() {
                    this.selectArea = value;
                  });
                });

              },
            ),

            Container(
              margin: EdgeInsets.only(left: adpWidth(40), right: adpWidth(40)),
              alignment: Alignment.centerLeft,
              height: adpHeight(50),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: hexColor('#f2f2f2'),
              ))),
              child: TextField(
                maxLength: 11,
                style: TextStyle(color: hexColor('#383838'), fontSize: 14),
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    counterText: '',   //在这个地方去除TextField输入时显示最大字数 ，必须去除，否则页面巨丑
                    border: InputBorder.none,
                    hintText: '请输入手机号码',
                    hintStyle:
                        TextStyle(color: hexColor('#a6a6a6'), fontSize: 14)),
                onChanged: (value) {
                  setState(() {
                    _phoneNum = value;
                  });
                },
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: adpWidth(40), right: adpWidth(40)),
              alignment: Alignment.centerLeft,
              height: adpHeight(50),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                width: 1,
                color: hexColor('#f2f2f2'),
              ))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: TextField(
                        maxLength: 6,
                        style:
                            TextStyle(color: hexColor('#383838'), fontSize: 14),
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            counterText: '',
                            border: InputBorder.none,
                            hintText: '请输入验证码',
                            hintStyle: TextStyle(
                                color: hexColor('#a6a6a6'), fontSize: 14)),
                        onChanged: (value) {
                          setState(() {
                            _codeValue = value;
                          });
                        },
                      ),
                    ),
                  ),

                  Container(
                    width: adpWidth(85),
                    height: adpHeight(25),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(left: BorderSide(width: 1,color: hexColor('#f2f2f2'))),
                    ),
                    child: DownCountTimer(
                      phoneNum: _phoneNum,
                      countdown: 60,
                      onTapCallback:(){
                        print('点击获取验证码');

                      },
                      available: true,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: adpHeight(20)),
            //确定按钮
            Container(
              width: adpWidth(300),
              height: adpHeight(38),
              child: FlatButton(
                color: hexColor('#88afd5'),
                child: Text('确 定',style: TextStyle(color: Colors.white,fontSize: 16),),
                onPressed: (){
                  if(_phoneNum == null || _phoneNum.length <= 0){
                    showToast('请输入手机号');
                    return;
                  }
                  if(_codeValue == null || _codeValue.length <= 0){
                    showToast('请输入验证码');
                    return;
                  }
                print('验证码 _codeValue  == $_codeValue  lenth = ${_codeValue.length}');
                },
              ),
            ),

            ///协议
            SizedBox(height: adpHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                InkWell(
                  child:Text.rich(TextSpan(text: '',children: [

                    TextSpan(
                      text: '点击确定，即表示已阅读并同意',
                      style: TextStyle(color: hex808080(),fontSize: 12),
                    ),
                    TextSpan(
                      text: '《注册会员服务条款》',
                      style: TextStyle(color: hexColor('#557a9d'),fontSize: 12),
                    )

                  ])) ,
                  onTap: (){
                    Navigator.pushNamed(context, '/userAgreenment');
                   print('点击了协议');
                  },
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
