import 'package:fast_food/config/colors/app_colors.dart';
import 'package:fast_food/config/routes/routes_path.dart';
import 'package:fast_food/core/components/custom_app_bar.dart';
import 'package:fast_food/core/components/custom_navigatation.dart';
import 'package:fast_food/ui/features/meal_details/controller/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../home/model/CategoryMealModel.dart';
import '../components/meals_of_specific_category_list_item.dart';

class MealsOfSpecificCategory extends StatelessWidget {
  const MealsOfSpecificCategory(
      {super.key, required this.list, required this.category});
  final List<CategoryMealModel> list;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Iconsax.arrow_left_2_outline)),
        title: const Text('Meals Of Specific Category'),
        color: AppColors.kWhiteColor,
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            CustomNavigation.navigateByNamedTo(context, RoutePath.mealDetails);
            MealCubit.get(context).getMealDetails(id: list[index].idMeal!);
          },
          child: MealsOfSpecificCategoryListItem(
            mealImage: list[index].strMealThumb!,
            mealName: list[index].strMeal!,
            mealTime: '15 min',
            mealCategory: category,
          ),
        ),
        separatorBuilder: (context, index) => Gap(10.h),
      ),
    );
  }
}
