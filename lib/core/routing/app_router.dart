
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/features/auth/login/cubit/login_cubit.dart';
import 'package:task/features/auth/login/login_screen.dart';
import 'package:task/features/home/home_screen.dart';
import 'package:task/injection.dart';




class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be bassed in any screen like this >> (arguments as ClassName)
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen()
          // BlocProvider(
          //   create: (context) => getIt<UserCubit>(),
          //   child: HomeScreen()),
        );

      //login
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) =>
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
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
