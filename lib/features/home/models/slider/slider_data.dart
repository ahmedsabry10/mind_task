import 'package:json_annotation/json_annotation.dart';
part 'slider_data.g.dart';

@JsonSerializable()
class SliderDataModel {
  @JsonKey(name: 'id')
  String id;
  @JsonKey(name: 'product_id')
  String productId;
  @JsonKey(name: 'image')
  String image;
  

  SliderDataModel(
      this.id,
      this.productId,
      this.image,

      );
  factory  SliderDataModel.fromJson(Map<String, dynamic> json) => _$SliderDataModelFromJson(json);
  Map<String, dynamic> toJson()=> _$SliderDataModelToJson(this);
}
