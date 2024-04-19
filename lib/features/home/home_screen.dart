import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/helpers/spacing.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/styles.dart';
import 'package:task/core/widgets/app_text_form_field.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/cubit/home_state.dart';
import 'package:task/features/home/widgets/slider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTextFormField(
                      hintText: "ابحث عن المنتج",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك قم قم بادخال اسم';
                        }
                      },
                      prefixIcon: const Icon(IconlyBold.search),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsManager.mainRed,
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: ColorsManager.gray,
                          width: 1.3,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.share))
                ],
              ),
              verticalSpace(20),
              BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, HomeState state) {
                return state.when(initial: () {
                  return Center(
                    child: SingleChildScrollView(
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
                    ),
                  );
                }, loading: () {
                  return Center(
                    child: SingleChildScrollView(
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
                    ),
                  );
                }, success: (getHomeDataResponse) {
                  return Column(
                    children: [
                      CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 170.h, 
                            enlargeCenterPage: false,
                            autoPlay: true,
                            aspectRatio: 15 / 14,
                            autoPlayCurve: Curves.linear,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 500),
                            viewportFraction: 1.00,
                          ),
                          itemCount: getHomeDataResponse.data.slider.length,
                          itemBuilder:
                              (BuildContext context, int index, int realIndex) {
                            return SliderWidegt(
                                sliderModel:
                                    getHomeDataResponse.data.slider[index]);                           
                          }),
                    ],
                  );
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
      ),
    );
  }

  void getData(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();

    context.read<HomeCubit>().emitGetData(
      authKey: prefs.getString('authKey')??"",
      userId: prefs.getString('userId')??'',
    );
  }
}
