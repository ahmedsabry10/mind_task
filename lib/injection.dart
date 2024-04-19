import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:task/features/auth/domain/login_repo.dart';
import 'package:task/features/auth/login/cubit/login_cubit.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/domain/home_repo.dart';

import 'core/network/api_service/api_service.dart';
import 'core/network/dio_factory.dart';

final getIt = GetIt.instance;

void initGetIt() {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  //Home
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));


}
