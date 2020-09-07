import 'package:json_annotation/json_annotation.dart';
import "menuModel.dart";
part 'responseModel.g.dart';

@JsonSerializable()
class ResponseModel {
    ResponseModel();

    num code;
    List<MenuModel> data;
    String msg;


    factory ResponseModel.fromJson(Map<String,dynamic> json) => _$ResponseModelFromJson(json);
    Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
