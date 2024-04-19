import 'package:task/core/network/api_constants.dart';
import 'package:task/core/network/api_error_handler.dart';
import 'package:task/core/network/api_result/api_result.dart';
import 'package:task/core/network/api_service/api_service.dart';
import 'package:task/features/home/models/home_model/home_model.dart';

class HomeRepo{
  final ApiService apiService;
  HomeRepo (this.apiService);
  Future<ApiResult<HomeModel>> getHomeData({
    required String authKey ,required String userId
  })async{
    try{
      var response=await apiService.getHomeData(
        ApiConstants.langBody,
        authKey,
        userId,
      );
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
