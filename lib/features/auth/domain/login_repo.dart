
import 'package:task/core/network/api_constants.dart';
import 'package:task/core/network/api_error_handler.dart';
import 'package:task/core/network/api_result/api_result.dart';
import 'package:task/core/network/api_service/api_service.dart';
import 'package:task/features/auth/models/login_response.dart';

class LoginRepo{
  final ApiService apiService;
  LoginRepo (this.apiService);
  Future<ApiResult<LoginResponse>> login({
    required String email ,required String password
  })async{
    try{
      var response=await apiService.login(
        ApiConstants.langBody,
        email,
        password,
        ApiConstants.tokenBody,
        ApiConstants.androidPlatform,
        ApiConstants.deviceIdBody,
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
