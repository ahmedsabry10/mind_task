import 'package:json_annotation/json_annotation.dart';
import 'package:task/features/home/models/home_data/home_data_model.dart';
part 'home_model.g.dart';

@JsonSerializable()
class HomeModel {
  @JsonKey(name: 'status')
  bool status;
  @JsonKey(name: 'msg')
  String message;
  @JsonKey(name: 'data')
  HomeDataModel data;

  

  HomeModel(
      this.status,
      this.message,
      this.data,
      );
  factory  HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);
  Map<String, dynamic> toJson()=> _$HomeModelToJson(this);
}
