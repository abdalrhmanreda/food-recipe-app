import 'package:fast_food/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../model/CategoryMealModel.dart';

class ListCategoryMealItem extends StatelessWidget {
  const ListCategoryMealItem({
    super.key,
    required this.mealModel,
  });

  final CategoryMealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(mealModel.strMealThumb!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 50.h,
              width: 150.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.8),
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(10),
          constraints: BoxConstraints(
            maxWidth: 150.w,
            maxHeight: 50.h,
          ),
          child: Text(mealModel.strMeal!,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(AppColors.kWhiteColor),
                    fontSize: getResponsiveFontSize(
                      context,
                      fontSize: 16.sp,
                    ),
                  )),
        )
      ],
    );
  }
}
