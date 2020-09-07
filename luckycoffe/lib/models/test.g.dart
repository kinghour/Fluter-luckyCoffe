// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) {
  return Test()
    ..code = json['code'] as num
    ..data = json['data'] as List
    ..msg = json['msg'] as String;
}

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'msg': instance.msg,
    };
