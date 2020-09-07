

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/macros.dart';

class LoadRegularPingFanText extends StatelessWidget {

 String title = '标题';
 String color = '2c4c7c';
 double fontSize = 14.0;
 double fontWeight = 1;

  LoadRegularPingFanText(this.title,this.color,this.fontSize,[this.fontWeight]);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
        color: hexColor(this.color),
        fontSize: ScreenUtil().setSp(this.fontSize),
        fontWeight: fontWeight == 1 ? FontWeight.w300:FontWeight.w600,
      ),
    );
  }
}
