//
//  BaseDialog
//  luckycoffe
//
//  Created by mac on .
//  Copyright © luckycoffe. All rights reserved.
//

import 'package:flutter/material.dart';

class BaseDialog extends Dialog {
  final BuildContext context;
  final Widget widget; //子控件

  final double width; //宽
  final double height; //高

  BaseDialog(this.context, {this.widget, this.width, this.height});

//  @override
//  Widget build(BuildContext context){
//    return
//  }

  void menuDialog() {
    showGeneralDialog(
        context: this.context,
        pageBuilder: (context, anim1, anim2) {},
        barrierColor: Colors.grey.withOpacity(.4),
        barrierDismissible: true,
        barrierLabel: "",
        transitionDuration: Duration(milliseconds: 400),
        transitionBuilder: (context, anim1, anim2, child) {
          return Transform.scale(
            scale: anim1.value,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: Text("Dialog"),
              content: Text("Hello world"),
            ),
          );
        });
  }
}
