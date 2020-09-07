
import 'package:flutter/material.dart';
import '../common/macros.dart';


/// * 快速创建dart界面模板,省去手敲stful、stleees

class modePage extends StatefulWidget {
  @override
  _modePageState createState() => _modePageState();
}

class _modePageState extends State<modePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('标题'),
      ),
    );
  }
}
