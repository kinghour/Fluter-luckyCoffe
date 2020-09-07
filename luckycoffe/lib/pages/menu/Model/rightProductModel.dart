// ignore: camel_case_types
import 'package:flutter/foundation.dart';

class RightProductModel extends ChangeNotifier {
  List<ProductModel> data;
  int code;
  String msg;

  RightProductModel({this.data, this.code, this.msg});

  factory RightProductModel.fromJson(Map<String, dynamic> json) {
    return RightProductModel(
      data: json['data'] != null
          ? (json['data'] as List).map((i) => ProductModel.fromJson(i)).toList()
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

class ProductModel {
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

  ProductModel(
      {this.afterSale,
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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
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
