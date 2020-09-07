// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menuModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuModel _$MenuModelFromJson(Map<String, dynamic> json) {
  return MenuModel()
    ..dateAdd = json['dateAdd'] as String
    ..id = json['id'] as num
    ..isUse = json['isUse'] as bool
    ..level = json['level'] as num
    ..name = json['name'] as String
    ..paixu = json['paixu'] as num
    ..pid = json['pid'] as num
    ..userId = json['userId'] as num;
}

Map<String, dynamic> _$MenuModelToJson(MenuModel instance) => <String, dynamic>{
      'dateAdd': instance.dateAdd,
      'id': instance.id,
      'isUse': instance.isUse,
      'level': instance.level,
      'name': instance.name,
      'paixu': instance.paixu,
      'pid': instance.pid,
      'userId': instance.userId,
    };
