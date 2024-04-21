
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/widgets/basics_screen/favourite_screen.dart';
import 'package:task/features/home/widgets/basics_screen/home_screen.dart';
import 'package:task/features/home/main_home_cubit/app_states.dart';
import 'package:task/features/home/widgets/basics_screen/list_screen.dart';
import '../widgets/basics_screen/ProfileScreen.dart';



class AppCubit extends Cubit <AppStates>{
  AppCubit ():super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex=0;
  List <Widget> screen=[
    const HomeScreen(),
    const ListScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
    
  ];

  void changeIndex(int index){
    currentIndex =index;
    emit(AppChangeBottomNavBarState());
  }


  
}