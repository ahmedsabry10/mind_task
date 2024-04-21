import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/features/home/app_cubit/app_cubit.dart';
import 'package:task/features/home/app_cubit/app_states.dart';

class MainHomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int selectedIndexTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          
          body: SafeArea(child: cubit.screen[cubit.currentIndex]),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              shape: const StadiumBorder(
                side: BorderSide(color: Colors.white, width: 4),
              ),
              child: const Icon(
                Icons.shopping_cart_rounded,
                color: ColorsManager.gray,
              ),
              onPressed: () {}),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    IconlyBold.home,
                    color: cubit.currentIndex == 0
                        ? ColorsManager.mainYellow
                        : ColorsManager.gray,
                  ),
                  onPressed: () {
                    cubit.changeIndex(0);
                  },
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.list,
                    color: cubit.currentIndex == 1
                        ? ColorsManager.mainYellow
                        : ColorsManager.gray,
                  ),
                  onPressed: () {
                    cubit.changeIndex(1);
                  },
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.solidHeart,
                    color: cubit.currentIndex == 2
                        ? ColorsManager.mainYellow
                        : ColorsManager.gray,
                  ),
                  onPressed: () {
                    cubit.changeIndex(2);
                  },
                ),
                IconButton(
                  icon: Icon(
                     FontAwesomeIcons.solidCircleUser,
                     fill: 0.5,
                    color: cubit.currentIndex == 3
                        ? ColorsManager.mainYellow
                        : ColorsManager.gray,
                  ),
                  onPressed: () {
                    cubit.changeIndex(3);
                  },
                ),
              ],
            ),
          ),
            );
      },
    );
  }
}
