import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/features/home/models/slider/slider_data.dart';
import 'package:task/features/home/widgets/slider/slider_item_widget.dart';

class SliderWidgetForHome extends StatelessWidget {
  final List<SliderDataModel> sliderModelList;
  SliderWidgetForHome({required this.sliderModelList});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: 170.h,
          enlargeCenterPage: false,
          autoPlay: true,
          aspectRatio: 15 / 14,
          autoPlayCurve: Curves.linear,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 500),
          viewportFraction: 1.00,
        ),
        itemCount: sliderModelList.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return SliderItemWidegt(sliderModel: sliderModelList[index]);
        });
    
  }
}
