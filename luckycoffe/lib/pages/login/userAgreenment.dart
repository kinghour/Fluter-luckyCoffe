
///  webView 加载网页url 以及加载动画

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../common/macros.dart';

import '../../common/customAppbar.dart';
import '../login/userAgreenment.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UserAreenmentPage extends StatefulWidget {
  @override
  _UserAreenmentPage createState() => _UserAreenmentPage();
}
class _UserAreenmentPage extends State<UserAreenmentPage> {

 bool isLoading = true;

 WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar:CustomAppbar(
//        context: context,
//        title: '用户协议',
//
//      ) ,
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: 'https://www.baidu.com/',
            //JS执行模式 是否允许JS执行
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _controller = controller;
            },
            navigationDelegate: (NavigationRequest request){//网页开始加载
              setState(() {
                isLoading = true; // 开始访问页面，更新状态
              });
              return NavigationDecision.navigate;
            },
            onPageStarted: (String url){
//              isLoading = true;
            },
            onPageFinished:(String url) {
              setState(() {
                isLoading = false; // 页面加载完成，更新状态
              });
            },
          ),
          Container(child:isLoading == true ? Center(child: CupertinoActivityIndicator(radius: adpHeight(30))):Container()),
        ],
      )
    );
  }
}
