import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/core/widgets/sliver_grid_with_height.dart';
import 'package:task/features/home/models/categories/categories_model.dart';

import '../../../../core/theming/styles.dart';

class CategoryItemWidgetForHome extends StatelessWidget {
  final List <CategoriesModel> categoriesModelList;
  CategoryItemWidgetForHome({required this.categoriesModelList});

  final ShapeBorder rectangle = const PolygonBorder(
    sides: 6,
    borderRadius: 5.0,
    rotate: 30.0,
    side: BorderSide(color: ColorsManager.secondYellow, width: 3.5),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90.h,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 2,
            height: 110.h,
            crossAxisCount: 4,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 80.w,
                  height: 70.h,
                  decoration: ShapeDecoration(
                      shape: rectangle,
                      color: Colors.white,
                      // image: DecorationImage(
                      //     image: NetworkImage(
                      //       "${categoriesModelList[index].icon}",
                      //     ),
                      //     fit: BoxFit.scaleDown)
                          ),
                          child:  Padding(
                            padding: EdgeInsets.symmetric(horizontal:  15.0.w,vertical: 15.h),
                            child: Image.network(
                              "${categoriesModelList[index].icon}",
                              width: 10.w,
                              height: 10.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                ),
                
                Text(
                  "${categoriesModelList[index].catName}",
                  style: TextStyles.font12BlackBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            );
          },
        ));
  }
}
