import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'short_desc')
  String shortDesc;
  @JsonKey(name: 'main_image')
  String mainImage;
  @JsonKey(name: 'list_price')
  String listPrice;
  @JsonKey(name: 'sale_price')
  String salePrice;
  @JsonKey(name: 'discount')
  String discount;
  @JsonKey(name: 'rating')
  dynamic rating;

  ProductModel(
      this.id,
      this.name,
      this.shortDesc,
      this.mainImage,
      this.listPrice,
      this.salePrice,
      this.discount,
      this.rating,
      );
  factory  ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson()=> _$ProductModelToJson(this);
}
