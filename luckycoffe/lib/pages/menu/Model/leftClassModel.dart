import 'package:flutter/material.dart';

class LeftClassModel with ChangeNotifier {
  List<ClasesModel> data;
  int code;
  String msg;

  int count = 0;

  void setData(List<ClasesModel> data) {
    this.data = data;
    notifyListeners();
  }

  void addCount() {
    count++;
    notifyListeners();
  }

  LeftClassModel({this.data, this.code, this.msg});

  factory LeftClassModel.fromJson(Map<String, dynamic> json) {
    return LeftClassModel(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => ClasesModel.fromJson(i)).toList()
          : null,
      code: json['code'],
      msg: json['msg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ClasesModel with ChangeNotifier {
  String dateAdd;
  String dateUpdate;
  int id;
  bool isUse;
  String key;
  int level;
  String name;
  int paixu;
  int pid;
  String type;
  int userId;

  ClasesModel(
      {this.dateAdd,
      this.dateUpdate,
      this.id,
      this.isUse,
      this.key,
      this.level,
      this.name,
      this.paixu,
      this.pid,
      this.type,
      this.userId});

  factory ClasesModel.fromJson(Map<String, dynamic> json) {
    return ClasesModel(
      dateAdd: json['dateAdd'],
      dateUpdate: json['dateUpdate'],
      id: json['id'],
      isUse: json['isUse'],
      key: json['key'],
      level: json['level'],
      name: json['name'],
      paixu: json['paixu'],
      pid: json['pid'],
      type: json['type'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['id'] = this.id;
    data['isUse'] = this.isUse;
    data['key'] = this.key;
    data['level'] = this.level;
    data['name'] = this.name;
    data['paixu'] = this.paixu;
    data['pid'] = this.pid;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}
