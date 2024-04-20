import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconly/iconly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/core/helpers/spacing.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/styles.dart';
import 'package:task/core/widgets/app_text_booton.dart';
import 'package:task/core/widgets/app_text_form_field.dart';
import 'package:task/core/widgets/shared_constants.dart';
import 'package:task/core/widgets/sliver_grid_with_height.dart';
import 'package:task/features/home/cubit/home_cubit.dart';
import 'package:task/features/home/cubit/home_state.dart';
import 'package:task/features/home/widgets/categories/category_item_widget.dart';
import 'package:task/core/widgets/star_widgets.dart';
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

                        ///Products
                        ProductWidgetForHome(productModelList: getHomeDataResponse.data.products ),

                        verticalSpace(5),
                        defaulyLine(),
                        verticalSpace(5),

                        ///Products choosen for you
                        ChoosenProductForHome(productModelList: getHomeDataResponse.data.selectedProducts),
                        
                        verticalSpace(5),
                        defaulyLine(),
                        verticalSpace(5),

                        ///New Products
                        NewProductForHome(productModelList:getHomeDataResponse.data.newProducts),
                    
                    
                    //     Column(
                    //       children: [
                    //         Row(
                    //           children: [
                    //             Text(
                    //               'منتجات مختارة لك',
                    //               style: TextStyles.font20DarkGray,
                    //             ),
                    //             Spacer(),
                    //             AppTextButton(
                    //                 buttonWidth: 70.w,
                    //                 buttonHeight: 30.h,
                    //                 borderRadius: 20,
                    //                 verticalPadding: 3.h,
                    //                 buttonText: "More",
                    //                 backgroundColor: ColorsManager.thirdYellow,
                    //                 textStyle: TextStyles.font15WhiteBold,
                    //                 onPressed: () {}),
                    //           ],
                    //         ),
                    //         GridView.builder(
                    //           shrinkWrap: true,
                    //           physics: NeverScrollableScrollPhysics(),
                    //           gridDelegate:
                    //               SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    //             mainAxisSpacing: 4.0,
                    //             crossAxisSpacing: 10,
                    //             height: 260.h,
                    //             crossAxisCount: 2,
                    //           ),
                    //           itemCount:
                    //               getHomeDataResponse.data.selectedProducts.length,
                    //           itemBuilder: (context, index) {
                    //             return Column(
                    //                crossAxisAlignment: CrossAxisAlignment.start,

                    //               children: [
                    //                 Container(
                    //                   width: double.infinity,
                    //                   height: 150.h,
                    //                   decoration: const BoxDecoration(
                    //                       color: ColorsManager.hint),
                    //                   child: Padding(
                    //                     padding: EdgeInsets.symmetric(
                    //                         horizontal: 15.0.w,
                    //                         vertical: 15.0.h),
                    //                     child: CachedNetworkImage(
                    //                       imageUrl:
                    //                           "${getHomeDataResponse.data.selectedProducts[index].mainImage}",
                    //                       alignment: Alignment.center,
                    //                       placeholder: (context, url) => Center(
                    //                         child: SingleChildScrollView(
                    //                           child: Column(
                    //                             children: [
                    //                               SpinKitFadingCircle(
                    //                                   size: 20,
                    //                                   itemBuilder:
                    //                                       (BuildContext context,
                    //                                           int index) {
                    //                                     return DecoratedBox(
                    //                                       decoration: BoxDecoration(
                    //                                           color: index
                    //                                                   .isEven
                    //                                               ? ColorsManager
                    //                                                   .mainRed
                    //                                               : ColorsManager
                    //                                                   .mainRed),
                    //                                     );
                    //                                   })
                    //                             ],
                    //                           ),
                    //                         ),
                    //                       ),
                    //                       errorWidget: (context, url, error) =>
                    //                           const Icon(Icons.error),
                    //                     ),
                    //                   ),
                    //                 ),
                    //                 //name
                    //                  Text(
                    //                         "${getHomeDataResponse.data.selectedProducts[index].name}",
                    //                         style: TextStyles.font15BlackBold,
                    //                         maxLines: 1,
                    //                         overflow: TextOverflow.ellipsis,
                    //                       ),
                    //                  //descricpe
                    //                  Text(
                    //                         "${getHomeDataResponse.data.selectedProducts[index].shortDesc}",
                    //                         style: TextStyles.font10BlackBold,
                    //                         maxLines: 2,
                    //                         overflow: TextOverflow.ellipsis,
                    //                       ),
                    //                   //rating 
                    //                   Row(
                    //                     children: [
                    //                       Text(
                    //                          '(10)',style: TextStyles.font12GrayRegular,
                    //                       ),
                    //                       StarRating(
                    //                               rating: 3.5,
                    //                               onRatingChanged: (rate) => setState(() => this.rating = rate),
                    //                               color: ColorsManager.mainYellow,
                    //                               ),
                    //                     ],
                    //                   ),
                    //                   //salePrice
                    //                    Text(
                    //                       "${getHomeDataResponse.data.selectedProducts[index].salePrice} درهم ",
                    //                       style: TextStyles.font15MainRed,
                    //                       maxLines: 1,
                    //                       overflow: TextOverflow.ellipsis,
                    //                     ),
                    //                   //listPrice  
                    //                    Text(
                    //                       "${getHomeDataResponse.data.selectedProducts[index].listPrice} درهم ",
                    //                       style: TextStyles.font9GrayRegular
                    //                           .copyWith(
                    //                         fontSize: 11.sp,
                    //                         decoration:
                    //                             TextDecoration.lineThrough,
                    //                       ),
                    //                       maxLines: 1,
                    //                       overflow: TextOverflow.ellipsis,
                    //                     ),
                    //                   ///sale
                                    
                    //                   Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.black,
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: Text(
                    //     "خصم ${getHomeDataResponse.data.selectedProducts[index].discount}% ",
                    //     style: TextStyles.font11WhiteBold,
                    //     maxLines: 1,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
                    // ),
                 
                                   
                    //               ],
                    //             );
                    //           },
                    //         )
                    //       ],
                    //     )
                      
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
