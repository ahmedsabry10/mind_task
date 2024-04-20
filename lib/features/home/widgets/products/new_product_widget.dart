import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/theming/styles.dart';
import 'package:task/core/widgets/app_text_booton.dart';
import 'package:task/core/widgets/sliver_grid_with_height.dart';
import 'package:task/core/widgets/star_widgets.dart';
import 'package:task/features/home/models/product/product_model.dart';

class NewProductForHome extends StatefulWidget {
   final List<ProductModel> productModelList;
  const NewProductForHome({required this.productModelList});

  @override
  State<NewProductForHome> createState() => _NewProductForHomeState();
}

class _NewProductForHomeState extends State<NewProductForHome> {
  double rating = 3.5;
  @override
  Widget build(BuildContext context) {
    return Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'منتجات جديدة',
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
                                    onPressed: () {}),
                              ],
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 10,
                                height: 260.h,
                                crossAxisCount: 2,
                              ),
                              itemCount:
                                 widget.productModelList.length,
                              itemBuilder: (context, index) {
                                return Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 150.h,
                                      decoration: const BoxDecoration(
                                          color: ColorsManager.hint),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.0.w,
                                            vertical: 15.0.h),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "${widget.productModelList[index].mainImage}",
                                          alignment: Alignment.center,
                                          placeholder: (context, url) => Center(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SpinKitFadingCircle(
                                                      size: 20,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return DecoratedBox(
                                                          decoration: BoxDecoration(
                                                              color: index
                                                                      .isEven
                                                                  ? ColorsManager
                                                                      .mainRed
                                                                  : ColorsManager
                                                                      .mainRed),
                                                        );
                                                      })
                                                ],
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    //name
                                     Text(
                                            "${widget.productModelList[index].name}",
                                            style: TextStyles.font15BlackBold,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                     //descricpe
                                     Text(
                                            "${widget.productModelList[index].shortDesc}",
                                            style: TextStyles.font10BlackBold,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                      //rating 
                                      Row(
                                        children: [
                                          Text(
                                             '(10)',style: TextStyles.font12GrayRegular,
                                          ),
                                          StarRating(
                                                  rating: 3.5,
                                                  onRatingChanged: (rate) => setState(() => this.rating = rate),
                                                  color: ColorsManager.mainYellow,
                                                  ),
                                        ],
                                      ),
                                      //salePrice
                                       Text(
                                          "${widget.productModelList[index].salePrice} درهم ",
                                          style: TextStyles.font15MainRed,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                     
                                  ],
                                );
                              },
                            )
                          ],
                        ) ; 
  }
}