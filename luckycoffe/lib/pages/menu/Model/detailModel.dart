import 'package:flutter/cupertino.dart';

class DetailModel {
  Data data;
  int code;
  String msg;

  DetailModel({this.data, this.code, this.msg});

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      code: json['code'],
      msg: json['msg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  BasicInfo basicInfo;
  Category category;
  String content;
  List<Pic> pics;
  List<String> pics2;
  List<Property> properties;

  Data(
      {this.basicInfo,
      this.category,
      this.content,
      this.pics,
      this.pics2,
      this.properties});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      basicInfo: json['basicInfo'] != null
          ? BasicInfo.fromJson(json['basicInfo'])
          : null,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      content: json['content'],
      pics: json['pics'] != null
          ? (json['pics'] as List).map((i) => Pic.fromJson(i)).toList()
          : null,
      pics2:
          json['pics2'] != null ? new List<String>.from(json['pics2']) : null,
      properties: json['properties'] != null
          ? (json['properties'] as List)
              .map((i) => Property.fromJson(i))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    if (this.basicInfo != null) {
      data['basicInfo'] = this.basicInfo.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.pics != null) {
      data['pics'] = this.pics.map((v) => v.toJson()).toList();
    }
    if (this.pics2 != null) {
      data['pics2'] = this.pics2;
    }
    if (this.properties != null) {
      data['properties'] = this.properties.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Property {
  List<ChildsCurGood> childsCurGoods;
  String dateAdd;
  String dateUpdate;
  int id;
  String name;
  int paixu;
  int userId;

  Property(
      {this.childsCurGoods,
      this.dateAdd,
      this.dateUpdate,
      this.id,
      this.name,
      this.paixu,
      this.userId});

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      childsCurGoods: json['childsCurGoods'] != null
          ? (json['childsCurGoods'] as List)
              .map((i) => ChildsCurGood.fromJson(i))
              .toList()
          : null,
      dateAdd: json['dateAdd'],
      dateUpdate: json['dateUpdate'],
      id: json['id'],
      name: json['name'],
      paixu: json['paixu'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['id'] = this.id;
    data['name'] = this.name;
    data['paixu'] = this.paixu;
    data['userId'] = this.userId;
    if (this.childsCurGoods != null) {
      data['childsCurGoods'] =
          this.childsCurGoods.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChildsCurGood {
  String dateAdd;
  int id;
  String name;
  int paixu;
  int propertyId;
  int userId;

  ChildsCurGood(
      {this.dateAdd,
      this.id,
      this.name,
      this.paixu,
      this.propertyId,
      this.userId});

  factory ChildsCurGood.fromJson(Map<String, dynamic> json) {
    return ChildsCurGood(
      dateAdd: json['dateAdd'],
      id: json['id'],
      name: json['name'],
      paixu: json['paixu'],
      propertyId: json['propertyId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateAdd'] = this.dateAdd;
    data['id'] = this.id;
    data['name'] = this.name;
    data['paixu'] = this.paixu;
    data['propertyId'] = this.propertyId;
    data['userId'] = this.userId;
    return data;
  }
}

class Pic {
  int goodsId;
  int id;
  String pic;
  int userId;

  Pic({this.goodsId, this.id, this.pic, this.userId});

  factory Pic.fromJson(Map<String, dynamic> json) {
    return Pic(
      goodsId: json['goodsId'],
      id: json['id'],
      pic: json['pic'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['id'] = this.id;
    data['pic'] = this.pic;
    data['userId'] = this.userId;
    return data;
  }
}

class BasicInfo with ChangeNotifier{
  String afterSale;
  int categoryId;
  String characteristic;
  double commission;
  int commissionType;
  String dateAdd;
  String dateUpdate;
  int fxType;
  int gotScore;
  int gotScoreType;
  int hidden;
  int id;
  bool kanjia;
  double kanjiaPrice;
  bool limitation;
  int logisticsId;
  int maxCoupons;
  bool miaosha;
  int minBuyNumber;
  double minPrice;
  int minScore;
  String name;
  int numberFav;
  int numberGoodReputation;
  int numberOrders;
  int numberSells;
  double originalPrice;
  int paixu;
  String pic;
  bool pingtuan;
  double pingtuanPrice;
  String propertyIds;
  int recommendStatus;
  String recommendStatusStr;
  bool sellEnd;
  bool sellStart;
  int shopId;
  int status;
  String statusStr;
  bool storeAlert;
  int stores;
  bool stores0Unsale;
  String tags;
  int type;
  int userId;
  int vetStatus;
  int views;
  double weight;

  String desc;
  double currentPrice;

  void setNum(int num){
    minBuyNumber = num;
    notifyListeners();
  }

  void setPrice(double price){
    currentPrice = price;
    notifyListeners();
  }

  void setTitle(String title){
    desc = title;
    notifyListeners();
  }

  BasicInfo({this.afterSale,
      this.categoryId,
      this.characteristic,
      this.commission,
      this.commissionType,
      this.dateAdd,
      this.dateUpdate,
      this.fxType,
      this.gotScore,
      this.gotScoreType,
      this.hidden,
      this.id,
      this.kanjia,
      this.kanjiaPrice,
      this.limitation,
      this.logisticsId,
      this.maxCoupons,
      this.miaosha,
      this.minBuyNumber,
      this.minPrice,
      this.minScore,
      this.name,
      this.numberFav,
      this.numberGoodReputation,
      this.numberOrders,
      this.numberSells,
      this.originalPrice,
      this.paixu,
      this.pic,
      this.pingtuan,
      this.pingtuanPrice,
      this.propertyIds,
      this.recommendStatus,
      this.recommendStatusStr,
      this.sellEnd,
      this.sellStart,
      this.shopId,
      this.status,
      this.statusStr,
      this.storeAlert,
      this.stores,
      this.stores0Unsale,
      this.tags,
      this.type,
      this.userId,
      this.vetStatus,
      this.views,
      this.weight});



  factory BasicInfo.fromJson(Map<String, dynamic> json) {
    return BasicInfo(
      afterSale: json['afterSale'],
      categoryId: json['categoryId'],
      characteristic: json['characteristic'],
      commission: json['commission'],
      commissionType: json['commissionType'],
      dateAdd: json['dateAdd'],
      dateUpdate: json['dateUpdate'],
      fxType: json['fxType'],
      gotScore: json['gotScore'],
      gotScoreType: json['gotScoreType'],
      hidden: json['hidden'],
      id: json['id'],
      kanjia: json['kanjia'],
      kanjiaPrice: json['kanjiaPrice'],
      limitation: json['limitation'],
      logisticsId: json['logisticsId'],
      maxCoupons: json['maxCoupons'],
      miaosha: json['miaosha'],
      minBuyNumber: json['minBuyNumber'],
      minPrice: json['minPrice'],
      minScore: json['minScore'],
      name: json['name'],
      numberFav: json['numberFav'],
      numberGoodReputation: json['numberGoodReputation'],
      numberOrders: json['numberOrders'],
      numberSells: json['numberSells'],
      originalPrice: json['originalPrice'],
      paixu: json['paixu'],
      pic: json['pic'],
      pingtuan: json['pingtuan'],
      pingtuanPrice: json['pingtuanPrice'],
      propertyIds: json['propertyIds'],
      recommendStatus: json['recommendStatus'],
      recommendStatusStr: json['recommendStatusStr'],
      sellEnd: json['sellEnd'],
      sellStart: json['sellStart'],
      shopId: json['shopId'],
      status: json['status'],
      statusStr: json['statusStr'],
      storeAlert: json['storeAlert'],
      stores: json['stores'],
      stores0Unsale: json['stores0Unsale'],
      tags: json['tags'],
      type: json['type'],
      userId: json['userId'],
      vetStatus: json['vetStatus'],
      views: json['views'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['afterSale'] = this.afterSale;
    data['categoryId'] = this.categoryId;
    data['characteristic'] = this.characteristic;
    data['commission'] = this.commission;
    data['commissionType'] = this.commissionType;
    data['dateAdd'] = this.dateAdd;
    data['dateUpdate'] = this.dateUpdate;
    data['fxType'] = this.fxType;
    data['gotScore'] = this.gotScore;
    data['gotScoreType'] = this.gotScoreType;
    data['hidden'] = this.hidden;
    data['id'] = this.id;
    data['kanjia'] = this.kanjia;
    data['kanjiaPrice'] = this.kanjiaPrice;
    data['limitation'] = this.limitation;
    data['logisticsId'] = this.logisticsId;
    data['maxCoupons'] = this.maxCoupons;
    data['miaosha'] = this.miaosha;
    data['minBuyNumber'] = this.minBuyNumber;
    data['minPrice'] = this.minPrice;
    data['minScore'] = this.minScore;
    data['name'] = this.name;
    data['numberFav'] = this.numberFav;
    data['numberGoodReputation'] = this.numberGoodReputation;
    data['numberOrders'] = this.numberOrders;
    data['numberSells'] = this.numberSells;
    data['originalPrice'] = this.originalPrice;
    data['paixu'] = this.paixu;
    data['pic'] = this.pic;
    data['pingtuan'] = this.pingtuan;
    data['pingtuanPrice'] = this.pingtuanPrice;
    data['propertyIds'] = this.propertyIds;
    data['recommendStatus'] = this.recommendStatus;
    data['recommendStatusStr'] = this.recommendStatusStr;
    data['sellEnd'] = this.sellEnd;
    data['sellStart'] = this.sellStart;
    data['shopId'] = this.shopId;
    data['status'] = this.status;
    data['statusStr'] = this.statusStr;
    data['storeAlert'] = this.storeAlert;
    data['stores'] = this.stores;
    data['stores0Unsale'] = this.stores0Unsale;
    data['tags'] = this.tags;
    data['type'] = this.type;
    data['userId'] = this.userId;
    data['vetStatus'] = this.vetStatus;
    data['views'] = this.views;
    data['weight'] = this.weight;
    return data;
  }
}

class Category {
  String dateAdd;
  int id;
  bool isUse;
  String name;
  int paixu;
  int pid;
  int shopId;
  int userId;

  Category(
      {this.dateAdd,
      this.id,
      this.isUse,
      this.name,
      this.paixu,
      this.pid,
      this.shopId,
      this.userId});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      dateAdd: json['dateAdd'],
      id: json['id'],
      isUse: json['isUse'],
      name: json['name'],
      paixu: json['paixu'],
      pid: json['pid'],
      shopId: json['shopId'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateAdd'] = this.dateAdd;
    data['id'] = this.id;
    data['isUse'] = this.isUse;
    data['name'] = this.name;
    data['paixu'] = this.paixu;
    data['pid'] = this.pid;
    data['shopId'] = this.shopId;
    data['userId'] = this.userId;
    return data;
  }
}
