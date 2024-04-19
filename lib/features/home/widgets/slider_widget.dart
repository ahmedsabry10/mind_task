import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/theming/colors.dart';
import 'package:task/features/home/models/slider/slider_data.dart';

class SliderWidegt extends StatelessWidget {
  final SliderDataModel sliderModel;
  SliderWidegt({super.key, required this.sliderModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:3.0.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
            imageUrl:sliderModel.image,
            fit: BoxFit.fill,
            height: 170.h,
            width: double.infinity,
            placeholder: (context, url) => const Center(
              child: Text(
                'Loading ...',
                style: TextStyle(
                    color: ColorsManager.mainYellow, fontSize: 15.0),
              ),
            ),
            errorWidget: (context, url, error) =>
            const Icon(Icons.error),
          ),
      ),
    );
  }
}
