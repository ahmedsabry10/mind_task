import 'package:task/core/theming/colors.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: ColorsManager.mainYellow,
    hintColor: ColorsManager.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryTextTheme: const TextTheme(
      headline1: TextStyle(
          fontSize: 28, color: Colors.black, fontWeight: FontWeight.w900),
      headline2: TextStyle(
          fontSize: 24, color: Colors.black, fontWeight: FontWeight.w900),
      headline3: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
      headline4: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
      headline5: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
      headline6: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      subtitle1: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      subtitle2: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
      button: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
    ),

    fontFamily: "Jannah",
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
          height: 1.3,
          fontSize: 22,
          fontFamily: "Jannah",
          color: Colors.black,
          fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        
        titleTextStyle: TextStyle(
            fontFamily: "Jannah",
            color: ColorsManager.mainYellow,
            fontSize: 20,
            fontWeight: FontWeight.w500)),
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0 ,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          size: 36.0,
          color:ColorsManager.mainYellow,
        ),
        unselectedIconTheme:  IconThemeData(
          size: 24.0,
          color: ColorsManager.gray,
        ),
        selectedLabelStyle: TextStyle(
            color:ColorsManager.mainYellow,
        ),
        selectedItemColor:ColorsManager.mainYellow,
      ),

    //fontFamily: 'jannah',
  );
}
