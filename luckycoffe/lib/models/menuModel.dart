import 'package:json_annotation/json_annotation.dart';

part 'menuModel.g.dart';

@JsonSerializable()
class MenuModel {
    MenuModel();

    String dateAdd;
    num id;
    bool isUse;
    num level;
    String name;
    num paixu;
    num pid;
    num userId;
    
    factory MenuModel.fromJson(Map<String,dynamic> json) => _$MenuModelFromJson(json);
    Map<String, dynamic> toJson() => _$MenuModelToJson(this);
}
