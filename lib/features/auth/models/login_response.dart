import 'package:json_annotation/json_annotation.dart';
import 'package:task/features/auth/models/data_model.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'status')
  bool status;
  @JsonKey(name: 'msg')
  String message;
  @JsonKey(name: 'data')
  DataModel data;

  

  LoginResponse(
      this.status,
      this.message,
      this.data,
      );
  factory  LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson()=> _$LoginResponseToJson(this);
}
