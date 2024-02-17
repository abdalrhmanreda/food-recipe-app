import 'package:fast_food/ui/features/meal_details/components/text_with_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';

class TableOfIngredients extends StatelessWidget {
  const TableOfIngredients(
      {super.key, required this.ingredients, required this.measurements});
  final List<String?> ingredients;
  final List<String?> measurements;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: const Color(AppColors.kSkyBlueColor),
        borderRadius: BorderRadius.circular(10.r),
      ),
      children: List.generate(
        ingredients.length,
        (index) => TableRow(
          children: [
            TextWithPadding(
              text: ingredients[index].toString(),
              color: AppColors.kBlackColor,
              fontSize: 13.sp,
            ),
            TextWithPadding(
              text: measurements[index].toString(),
              color: AppColors.kBlackColor,
              fontSize: 13.sp,
            ),
          ],
        ),
      ),
    );
  }
}
