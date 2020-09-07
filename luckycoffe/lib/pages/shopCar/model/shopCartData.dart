

class ShoppCartData {

  int id;
  String name;
  double price;
  int number;
  Map<String, int> spec;
  String specName;
  bool checked;

  /// 默认商品购物车选中
  ShoppCartData({
    this.id,
    this.name,
    this.price, // 当前规格的单价
    this.number,
    this.spec,
    this.specName,
    this.checked
  });

  //反序列化
  factory ShoppCartData.fromJson(Map<String, dynamic> json) =>
      _$ShoppCartDataFromJson(json);
  //序列化
  Map<String, dynamic> toJson() => _$ShoppCartDataToJson(this);


}


ShoppCartData _$ShoppCartDataFromJson(Map<String, dynamic> json) {
  return ShoppCartData(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num)?.toDouble(),
      number: json['number'] as int,
      spec: (json['spec'] as Map<String, dynamic>)?.map(
            (k, e) => MapEntry(k, e as int),
      ),
      specName: json['specName'] as String,
      checked: json['checked'] as bool);
}

Map<String, dynamic> _$ShoppCartDataToJson(ShoppCartData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'number': instance.number,
      'spec': instance.spec,
      'specName': instance.specName,
      'checked': instance.checked
    };
