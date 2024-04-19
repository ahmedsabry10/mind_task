import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theming/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TaskApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool isAuth;
  const TaskApp({
    super.key,
    required this.appRouter,
    required this.isAuth,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        child: MaterialApp(
          title: "Task",
          theme: appTheme(),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('ar'), // ar
          ],
          locale: Locale('ar'),
          debugShowCheckedModeBanner: false,
          initialRoute:isAuth? Routes.homeScreen:Routes.loginScreen,
          onGenerateRoute: appRouter.generateRoute,
        ));
  }
}
