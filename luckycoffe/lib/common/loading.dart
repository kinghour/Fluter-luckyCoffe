//
//  loading
//  luckycoffe
//
//  Created by mac on .
//  Copyright © luckycoffe. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'macros.dart';

class Loading {
  static show(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(adpHeight(4)),
                  color: Colors.black54,
                ),
                width: adpWidth(64),
                height: adpWidth(64),
                child: Container(
                  alignment: Alignment.center,
                  width: adpWidth(40),
                  height: adpWidth(40),
                  child: CupertinoActivityIndicator(
                    radius: adpHeight(14),
                  ),
                ),
              ),
            );
          }),
        );
      },
      barrierDismissible: false,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: rgba(255, 255, 255, 0),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ),
          child: child,
        );
      },
    );
  }

  static hide(BuildContext context) {
    Navigator.pop(context);
  }
}
