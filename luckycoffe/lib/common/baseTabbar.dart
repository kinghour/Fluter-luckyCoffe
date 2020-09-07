
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:luckycoffe/common/macros.dart';


Material BaseTabbar({

  List<Widget> tabs,
  TabController tabController,

  }){

  return Material(
    color: Colors.white,
    child: TabBar(
      tabs: tabs,
      controller: tabController,
      indicatorSize:TabBarIndicatorSize.label ,
      indicatorColor: hex88afd5(),
      indicatorWeight: adpHeight(4),
      labelColor: hex88afd5(),
      labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
      unselectedLabelColor:hexColor('#505050') ,
      unselectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),

    ),
  );
}


