import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/helpers/extensitions.dart';
import 'package:task/core/helpers/spacing.dart';
import 'package:task/core/routing/routes.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/styles.dart';
import 'package:task/core/widgets/app_text_booton.dart';
import 'package:task/core/widgets/app_text_form_field.dart';
import 'package:task/core/widgets/shared_constants.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/cubit/home_state.dart';
import 'package:task/features/home/widgets/categories/category_item_widget.dart';
import 'package:task/features/home/widgets/products/choosen_product.dart';
import 'package:task/features/home/widgets/products/new_product_widget.dart';
import 'package:task/features/home/widgets/products/product_widget_for_home.dart';
import 'package:task/features/home/widgets/slider/slider_widget.dart';

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

  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SingleChildScrollView(
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
                  },

                      ///Loading
                      loading: () {
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
                  },

                      ///Success
                      success: (getHomeDataResponse) {
                    return Column(
                      children: [
                        ///Slider Data
                        SliderWidgetForHome(
                          sliderModelList: getHomeDataResponse.data.slider,
                        ),
                        verticalSpace(5),

                        ///categories Data
                        CategoryItemWidgetForHome(
                            categoriesModelList:
                                getHomeDataResponse.data.categories),
                        verticalSpace(5),
                        defaulyLine(),
                        verticalSpace(5),

                        Row(
          children: [
            Text(
              'المنتجات',
              style: TextStyles.font20DarkGray,
            ),
            Spacer(),
            AppTextButton(
                buttonWidth: 70.w,
                buttonHeight: 30.h,
                borderRadius: 20,
                verticalPadding: 3.h,
                buttonText: "More",
                backgroundColor: ColorsManager.thirdYellow,
                textStyle: TextStyles.font15WhiteBold,
                onPressed: () {
                  context.pushNamed(
                    Routes.moreProductScrren
                    );
                }),
          ],
        ),
                        ///Products
                        ProductWidgetForHome(
                            productModelList:
                                getHomeDataResponse.data.products),

                        verticalSpace(5),
                        defaulyLine(),
                        verticalSpace(5),

                        ///Products choosen for you
                        ChoosenProductForHome(
                            productModelList:
                                getHomeDataResponse.data.selectedProducts),

                        verticalSpace(5),
                        defaulyLine(),
                        verticalSpace(5),

                        ///New Products
                        NewProductForHome(
                            productModelList:
                                getHomeDataResponse.data.newProducts),
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
        ),
      ),
    );
  }

  void getData(BuildContext context) async {
    var prefs = await SharedPreferences.getInstance();

    context.read<HomeCubit>().emitGetData(
          authKey: prefs.getString('authKey') ?? "",
          userId: prefs.getString('userId') ?? '',
        );
  }
}
