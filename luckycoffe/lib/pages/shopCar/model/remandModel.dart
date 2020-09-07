import 'dart:convert' show json;
import 'package:flutter/foundation.dart';
import 'package:luckycoffe/common/httpRequst/dioUtils.dart';

void tryCatch(Function f) {
  try {
    f?.call();
  } catch (e, stack) {
    debugPrint('$e');
    debugPrint('$stack');
  }
}

T asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  if (value != null) {
    final String valueS = value.toString();
    if (0 is T) {
      return int.tryParse(valueS) as T;
    } else if (0.0 is T) {
      return double.tryParse(valueS) as T;
    } else if ('' is T) {
      return valueS as T;
    } else if (false is T) {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return bool.fromEnvironment(value.toString()) as T;
    }
  }
  return null;
}

class RemandModel with ChangeNotifier{

  RemandModel({
    this.code,
    this.data,
    this.msg,
  });

  factory RemandModel.fromJson(Map<String, dynamic> jsonRes) {
    if (jsonRes == null) {
      return null;
    }

    final List<RemandItemModel> data = jsonRes['data'] is List ? <RemandItemModel>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']) {
        if (item != null) {
          tryCatch(() {
            data.add(RemandItemModel.fromJson(asT<Map<String, dynamic>>(item)));
          });
        }
      }
    }
    return RemandModel(
      code: asT<int>(jsonRes['code']),
      data: data,
      msg: asT<String>(jsonRes['msg']),
    );
  }

  int code;
  List<RemandItemModel> data;
  String msg;

  setData(RemandModel model){
    this.data = model.data;
    notifyListeners();
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'data': data,
        'msg': msg,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}

class RemandItemModel {
  RemandItemModel({
    this.afterSale,
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
    this.overseas,
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
    this.weight,
  });

  factory RemandItemModel.fromJson(Map<String, dynamic> jsonRes) => jsonRes == null
      ? null
      : RemandItemModel(
          afterSale: asT<String>(jsonRes['afterSale']),
          categoryId: asT<int>(jsonRes['categoryId']),
          characteristic: asT<String>(jsonRes['characteristic']),
          commission: asT<int>(jsonRes['commission']),
          commissionType: asT<int>(jsonRes['commissionType']),
          dateAdd: asT<String>(jsonRes['dateAdd']),
          dateUpdate: asT<String>(jsonRes['dateUpdate']),
          fxType: asT<int>(jsonRes['fxType']),
          gotScore: asT<int>(jsonRes['gotScore']),
          gotScoreType: asT<int>(jsonRes['gotScoreType']),
          hidden: asT<int>(jsonRes['hidden']),
          id: asT<int>(jsonRes['id']),
          kanjia: asT<bool>(jsonRes['kanjia']),
          kanjiaPrice: asT<int>(jsonRes['kanjiaPrice']),
          limitation: asT<bool>(jsonRes['limitation']),
          logisticsId: asT<int>(jsonRes['logisticsId']),
          maxCoupons: asT<int>(jsonRes['maxCoupons']),
          miaosha: asT<bool>(jsonRes['miaosha']),
          minBuyNumber: asT<int>(jsonRes['minBuyNumber']),
          minPrice: asT<double>(jsonRes['minPrice']),
          minScore: asT<int>(jsonRes['minScore']),
          name: asT<String>(jsonRes['name']),
          numberFav: asT<int>(jsonRes['numberFav']),
          numberGoodReputation: asT<int>(jsonRes['numberGoodReputation']),
          numberOrders: asT<int>(jsonRes['numberOrders']),
          numberSells: asT<int>(jsonRes['numberSells']),
          originalPrice: asT<double>(jsonRes['originalPrice']),
          overseas: asT<bool>(jsonRes['overseas']),
          paixu: asT<int>(jsonRes['paixu']),
          pic: asT<String>(jsonRes['pic']),
          pingtuan: asT<bool>(jsonRes['pingtuan']),
          pingtuanPrice: asT<int>(jsonRes['pingtuanPrice']),
          propertyIds: asT<String>(jsonRes['propertyIds']),
          recommendStatus: asT<int>(jsonRes['recommendStatus']),
          recommendStatusStr: asT<String>(jsonRes['recommendStatusStr']),
          sellEnd: asT<bool>(jsonRes['sellEnd']),
          sellStart: asT<bool>(jsonRes['sellStart']),
          shopId: asT<int>(jsonRes['shopId']),
          status: asT<int>(jsonRes['status']),
          statusStr: asT<String>(jsonRes['statusStr']),
          storeAlert: asT<bool>(jsonRes['storeAlert']),
          stores: asT<int>(jsonRes['stores']),
          stores0Unsale: asT<bool>(jsonRes['stores0Unsale']),
          tags: asT<String>(jsonRes['tags']),
          type: asT<int>(jsonRes['type']),
          userId: asT<int>(jsonRes['userId']),
          vetStatus: asT<int>(jsonRes['vetStatus']),
          views: asT<int>(jsonRes['views']),
          weight: asT<int>(jsonRes['weight']),
        );

  String afterSale;
  int categoryId;
  String characteristic;
  int commission;
  int commissionType;
  String dateAdd;
  String dateUpdate;
  int fxType;
  int gotScore;
  int gotScoreType;
  int hidden;
  int id;
  bool kanjia;
  int kanjiaPrice;
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
  bool overseas;
  int paixu;
  String pic;
  bool pingtuan;
  int pingtuanPrice;
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
  int weight;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'afterSale': afterSale,
        'categoryId': categoryId,
        'characteristic': characteristic,
        'commission': commission,
        'commissionType': commissionType,
        'dateAdd': dateAdd,
        'dateUpdate': dateUpdate,
        'fxType': fxType,
        'gotScore': gotScore,
        'gotScoreType': gotScoreType,
        'hidden': hidden,
        'id': id,
        'kanjia': kanjia,
        'kanjiaPrice': kanjiaPrice,
        'limitation': limitation,
        'logisticsId': logisticsId,
        'maxCoupons': maxCoupons,
        'miaosha': miaosha,
        'minBuyNumber': minBuyNumber,
        'minPrice': minPrice,
        'minScore': minScore,
        'name': name,
        'numberFav': numberFav,
        'numberGoodReputation': numberGoodReputation,
        'numberOrders': numberOrders,
        'numberSells': numberSells,
        'originalPrice': originalPrice,
        'overseas': overseas,
        'paixu': paixu,
        'pic': pic,
        'pingtuan': pingtuan,
        'pingtuanPrice': pingtuanPrice,
        'propertyIds': propertyIds,
        'recommendStatus': recommendStatus,
        'recommendStatusStr': recommendStatusStr,
        'sellEnd': sellEnd,
        'sellStart': sellStart,
        'shopId': shopId,
        'status': status,
        'statusStr': statusStr,
        'storeAlert': storeAlert,
        'stores': stores,
        'stores0Unsale': stores0Unsale,
        'tags': tags,
        'type': type,
        'userId': userId,
        'vetStatus': vetStatus,
        'views': views,
        'weight': weight,
      };
  @override
  String toString() {
    return json.encode(this);
  }
}
