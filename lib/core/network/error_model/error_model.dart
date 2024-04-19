
import 'package:freezed_annotation/freezed_annotation.dart';
part 'error_model.g.dart';

@JsonSerializable()
class ErrorModel{
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'msg')
  String msg;
  @JsonKey(name: 'data')
  String data;
  ErrorModel(this.status , this.msg, this.data);

  factory ErrorModel.fromJson(Map<String,dynamic> json)=>_$ErrorModelFromJson(json);
  Map<String ,dynamic> toJson()=>_$ErrorModelToJson(this);
}