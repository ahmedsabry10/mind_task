import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:task/features/auth/models/login_response.dart';
import 'package:task/features/home/models/home_model/home_model.dart';
import 'package:task/features/home/models/more_product/more_product_model.dart';
import '../api_constants.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  //login
  @POST(ApiConstants.login)
  @MultiPart()
  Future<LoginResponse> login(
    @Header(ApiConstants.langTitle) String lang,
    @Part() String email,
    @Part() String password,
    @Part() String token,
    @Part() String platform,
    @Part() String device_id,
  );

  //Home
  @POST(ApiConstants.home)
  @MultiPart()
  Future<HomeModel> getHomeData(
    @Header(ApiConstants.langTitle) String lang,
    @Part() String auth_key,
    @Part() String user_id,
  );

  @POST(ApiConstants.moreProduct)
  @MultiPart()
  Future<MoreProductModel> getMoreProductData(
    @Header(ApiConstants.langTitle) String lang,
    @Part() String auth_key,
    @Part() String user_id,
    @Part() String search_with,
    @Part() String home_types,
    @Part() int item_count,
    @Part() int limit,
  );
  
}
