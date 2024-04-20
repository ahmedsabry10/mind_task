import 'package:flutter/material.dart';
import 'package:task/core/theming/colors.dart';

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount =5, this.rating = .0, required this.onRatingChanged,required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star_border,
        color:ColorsManager.mainYellow,
        size: 20,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = Icon(
        Icons.star_half,
        color: color,
        size: 20,
      );
    } else {
      icon = Icon(
        Icons.star,
        color: color,
        size: 20,
      );
    }
    return InkResponse(
      // ignore: unnecessary_null_comparison
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: List.generate(starCount, (index) => buildStar(context, index)));
  }
}