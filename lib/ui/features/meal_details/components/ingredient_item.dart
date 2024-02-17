import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class IngredientItem extends StatelessWidget {
  const IngredientItem({
    super.key,
    required this.ingredient,
  });
  final String ingredient;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 3.r,
          backgroundColor: const Color(AppColors.kPrimaryColor),
        ),
        Gap(5.w),
        Text(ingredient,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: getResponsiveFontSize(context, fontSize: 15.sp),
                )),
      ],
    );
  }
}
