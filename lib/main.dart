import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/routing/app_router.dart';
import 'package:task/injection.dart';
import 'package:task/task_app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  initGetIt();
  final prefs = await SharedPreferences.getInstance();
  bool? isSignIn= prefs.getBool('isAuth');
  print("isAuth =");
  print(isSignIn);
  runApp( 
    TaskApp(
      isAuth: isSignIn?? false,
      appRouter: AppRouter(),)
    );
}

