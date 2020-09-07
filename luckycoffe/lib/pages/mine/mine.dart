import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 0),
      children: <Widget>[
        //顶部登录
        headLogWiget(),

        //选择栏
        Column(
          children: itemList(),
        ),
        
        //图片
        SizedBox(height: adpHeight(8)),
        Image.asset(imagePath('mine/mine_bottom.png'),width: adpWidth(335),height: adpHeight(114),),
      ],
    );
  }


  //顶部登录栏
  headLogWiget(){

    return Stack(
      children: <Widget>[
        Container(

          height: adpHeight(180),
          color: hexColor('#68443c'),
          child: Container(

            margin: EdgeInsets.only(left: adpWidth(20),top: adpHeight(74.5),bottom: adpHeight(47.5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(adpHeight(45)),
                  child: Image.asset('lib/assets/images/mine/mine_head.png',fit: BoxFit.cover,),
                ),
                SizedBox(width: adpWidth(10),),
                GestureDetector(
                  child: Text('立即登录',style: TextStyle(fontSize:18,color:Colors.white),),
                  onTap: (){
                    Navigator.pushNamed(context, '/loginType');
                   print('点击了登录');
                  },
                ),
                Spacer(),
                Image.asset('lib/assets/images/mine/minehead.png',width: adpWidth(17.5),height: adpWidth(17.5),),
                SizedBox(width: adpWidth(20),),
              ],
            ),
          ),
        ),
      ],
    );
  }


  itemList(){

    List titleArr = ['个人资料','咖啡钱包','优惠券','兑换优惠','发票管理','','帮助反馈'];
    List iconArr = ['mine1','mine2','mine3','mine4','mine5','','mine6'];
    List <Widget> itemsArr = List();
    for(var i = 0; i < titleArr.length; i++){

      String title =  titleArr[i];
      bool isShowBottomLine = i > 3 ? false:true;
      if(null != title && title.length > 0){
        itemsArr.add(item(title,isShowBottomLine,i));
      }else{
        itemsArr.add(Container(color: rgba(242, 242, 242, 1),height: adpHeight(9),));
      }
    }
    return itemsArr;
  }

  item(String title,bool isShowBottomLine,int index){

    return GestureDetector(
      child: Container(
        height: adpHeight(50),
        margin: EdgeInsets.only(left: adpWidth(20)),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: isShowBottomLine ? 2:0,color:rgba(242, 242, 242, 1))),
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: adpWidth(22.5),
              height: adpHeight(15),
              alignment: Alignment.centerLeft,
              child: Image.asset('lib/assets/images/mine/mine1.png'),
            ),
            SizedBox(width: adpWidth(15),),
            Text(title,style: TextStyle(fontSize:14,color: hexColor('#383838') ),),
            Spacer(),
            Image.asset('lib/assets/images/mine/minehead.png',width: adpWidth(14),height: adpWidth(14),),
            SizedBox(width: adpWidth(14)),
          ],
        ),
      ),
      onTap: (){
        print('我的 -> 点击了第 $index 个');
      },
    );
  }
}

