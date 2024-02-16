import 'package:fast_food/config/colors/app_colors.dart';
import 'package:fast_food/core/components/custom_navigatation.dart';
import 'package:fast_food/ui/features/meals_of_specific_category/screens/meals_of_specific_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../model/CategoryMealModel.dart';
import 'List_category_meal_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key, required this.list, required this.category});
  final List<CategoryMealModel> list;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$category Recipe',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 18.sp,
                      ),
                    )),
            IconButton(
                onPressed: () {
                  CustomNavigation.navigateTo(
                      context,
                      MealsOfSpecificCategory(
                        list: list,
                        category: category,
                      ));
                },
                icon: const Icon(
                  Iconsax.arrow_right_1_outline,
                  color: Color(AppColors.kPrimaryColor),
                )),
          ],
        ),
        Gap(10.h),
        SizedBox(
          height: 150.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  ListCategoryMealItem(mealModel: list[index]),
              separatorBuilder: (context, index) => Gap(10.w),
              itemCount: list.length),
        ),
      ],
    );
  }
}
