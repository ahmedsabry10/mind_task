import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/features/auth/login/cubit/login_cubit.dart';
import 'package:task/features/auth/login/login_screen.dart';
import 'package:task/features/home/app_cubit/app_cubit.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/widgets/basics_screen/home_screen.dart';
import 'package:task/features/home/app_cubit/app_states.dart';
import 'package:task/features/home/main_home_screen.dart';
import 'package:task/features/home/widgets/basics_screen/more_products.dart';
import 'package:task/injection.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be bassed in any screen like this >> (arguments as ClassName)
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.mainHomeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
              providers: [
                  BlocProvider(
                        create: (BuildContext context) => AppCubit(),
          
                        ),
                  BlocProvider(
                       create: (context) => getIt<HomeCubit>()
                  ),
              ],
                            child: BlocConsumer<AppCubit, AppStates>(
                          listener: (context, state) {
                          },
                          builder: (context, state) {
                            return MainHomeScreen();
                          },
          ),)
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<HomeCubit>(), child: HomeScreen()),
        );

      //login
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

        case Routes.moreProductScrren:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
              create: (context) => getIt<HomeCubit>(), child: MoreProductScreen()),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route define for ${settings.name}'),
                  ),
                ));
    }
  }
}
