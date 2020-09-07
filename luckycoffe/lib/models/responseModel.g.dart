// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responseModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) {
  return ResponseModel()
    ..code = json['code'] as num
    ..data = (json['data'] as List)
        ?.map((e) =>
            e == null ? null : MenuModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };
