import 'package:json_annotation/json_annotation.dart';
import 'package:task/features/home/models/categories/categories_model.dart';
import 'package:task/features/home/models/product/product_model.dart';
import 'package:task/features/home/models/slider/slider_data.dart';
part 'home_data_model.g.dart';

@JsonSerializable()
class HomeDataModel {
  @JsonKey(name: 'slider')
  List<SliderDataModel> slider;
  @JsonKey(name: 'categories')
  List<CategoriesModel> categories;
  @JsonKey(name: 'products')
  List<ProductModel> products;
  @JsonKey(name: 'selected_products')
  List<ProductModel> selectedProducts;
  @JsonKey(name: 'new_products')
  List<ProductModel> newProducts;

  HomeDataModel(
    this.slider, this.categories, this.products,
    this.selectedProducts,
    this.newProducts,
  );
  factory HomeDataModel.fromJson(Map<String, dynamic> json) =>
      _$HomeDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeDataModelToJson(this);
}
