import 'package:json_annotation/json_annotation.dart';
import 'package:task/features/home/models/product/product_model.dart';
part 'more_product_model.g.dart';

@JsonSerializable()
class MoreProductModel {
  @JsonKey(name: 'status')
  bool status;
  @JsonKey(name: 'msg')
  String message;
  @JsonKey(name: 'data')
  List<ProductModel> data;

  

  MoreProductModel(
      this.status,
      this.message,
      this.data,
      );
  factory  MoreProductModel.fromJson(Map<String, dynamic> json) => _$MoreProductModelFromJson(json);
  Map<String, dynamic> toJson()=> _$MoreProductModelToJson(this);
}
