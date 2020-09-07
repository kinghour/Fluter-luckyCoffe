import 'package:json_annotation/json_annotation.dart';

part 'test.g.dart';

@JsonSerializable()
class Test {
    Test();

    num code;
    List data;
    String msg;
    
    factory Test.fromJson(Map<String,dynamic> json) => _$TestFromJson(json);
    Map<String, dynamic> toJson() => _$TestToJson(this);
}
