import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:luckycoffe/common/macros.dart';
import 'package:luckycoffe/common/global.dart';
import '../home/selectItem.dart';
import '../home/selectType.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List bannaerList = [
    'home_banner1.jpg',
    'home_banner2.jpg',
    'home_banner3.jpg'
  ];

  final titleArr = ['现在下单','咖啡钱包','送Ta咖啡','企业账户'];
  final descArr = ['ORDER NOW','COFFRR WALLET','SEND COFFEE','ENTERPRISE ACCOUNT'];
  final iconArr = ['coffe.png','qianbao.png','gift.png','qiye.png' ];
  List<Widget> items;

  @override
  void initState() {
    super.initState();

    items = new List( );
    for(var i = 0; i < titleArr.length;i++){

      String imgPath =  'lib/assets/images/home/' + iconArr[i];
      items.add(SelectItem(title: titleArr[i],desc: descArr[i],imgPath:imgPath,index: i,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Stack(
          children: <Widget>[

            Container(
              width: screenW(),
              height: adpHeight(208),
              child: Swiper(
                  itemCount: 3,
                  autoplay: true,
                  pagination: new SwiperPagination(),
                  itemBuilder: (BuildContext context, int index) {
                    return Image.asset(
                      'lib/assets/images/home/' + bannaerList[index],
                      fit: BoxFit.fill,
                    );
                  }),
            ),
            Positioned(
              top: adpHeight(35),
              right: adpWidth(25),
              child: Container(
                width: adpWidth(42),
                height: adpWidth(42),
                decoration: BoxDecoration(
                  color: rgba(43, 43, 43, 0.3),
                  borderRadius: BorderRadius.all(Radius.circular(adpWidth(42))),
                ),
                child: IconButton(
                  icon: Image.asset(
                    'lib/assets/images/home/home_saomiao.png',
                  ),
                  padding: EdgeInsets.all(adpWidth(7)),
                  onPressed: () {

                    Navigator.push( context,
                        MaterialPageRoute(builder: (context) {
                          return null;
                        }));
                    print('点击了扫描按钮');
                  },
                ),
              ),
            )
          ],
        ),
        SelectType(),
        Container(
          child: Column(
            children: items,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: adpWidth(10.0),right:adpWidth(10),top: adpWidth(10)) ,
          child: Image.asset('lib/assets/images/home/home_bottom.png'),
        )
      ],
    );
  }
}



