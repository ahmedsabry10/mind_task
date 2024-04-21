import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/helpers/extensitions.dart';
import 'package:task/core/helpers/spacing.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/styles.dart';
import 'package:task/core/widgets/shared_constants.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/cubit/home_state.dart';
import 'package:task/features/home/widgets/products/product_widget_for_home.dart';

class MoreProductScreen extends StatefulWidget {
  const MoreProductScreen({super.key});

  @override
  State<MoreProductScreen> createState() => _MoreProductScreenState();
}

class _MoreProductScreenState extends State<MoreProductScreen> {
  @override
  void initState() {
    getData(context);
    super.initState();
  }

  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "المنتجات",
          style: TextStyles.font16GrayRegular,
        ),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              FontAwesomeIcons.circleArrowRight,
              fill: 1,
              color: ColorsManager.mainYellow,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              defaulySolidLine(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  children: [
                    BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, HomeState state) {
                      return state.when(initial: () {
                        return Center(
                          child: Column(
                            children: [
                              SpinKitThreeBounce(
                                  size: 20,
                                  itemBuilder: (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? ColorsManager.mainRed
                                              : ColorsManager.mainRed),
                                    );
                                  })
                            ],
                          ),
                        );
                      },
                            
                          ///Loading
                          loading: () {
                        return Center(
                          child: Column(
                            children: [
                              SpinKitThreeBounce(
                                  size: 20,
                                  itemBuilder: (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: index.isEven
                                              ? ColorsManager.mainRed
                                              : ColorsManager.mainRed),
                                    );
                                  })
                            ],
                          ),
                        );
                      },
                            
                          ///Success
                          success: (getHomeDataResponse) {
                        return Column(
                          children: [
                          
                            
                            verticalSpace(5),
                            
                            ///Products
                            ProductWidgetForHome(
                                productModelList: getHomeDataResponse.data),
                          ],
                        );
                            
                        ///error
                      }, error: (error) {
                        return Center(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error_rounded,
                                  size: 200,
                                ),
                                Text(
                                  'Something went wrong , please try again later ',
                                  style: TextStyles.font15BlackBold,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getData(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();

    context.read<HomeCubit>().emitGetMoreProducts(
          authKey: prefs.getString('authKey') ?? "",
          userId: prefs.getString('userId') ?? '',
        );
  }
}
