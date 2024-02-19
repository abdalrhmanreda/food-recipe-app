import 'package:fast_food/core/constant/app_constant.dart';
import 'package:fast_food/core/methods/get_responsive_text/responsive_text.dart';
import 'package:fast_food/ui/features/meal_details/controller/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/components/custom_sliver_bar.dart';
import '../../../../core/components/custom_sliver_to_box_adapter.dart';
import '../components/ingredient_item.dart';
import '../components/more_details.dart';
import '../components/name_and_rate_part.dart';
import '../components/table_of_ingrentients.dart';
import '../components/watch_and_add_to_bookmark_buttons.dart';

class MealDetailsScreenBody extends StatelessWidget {
  const MealDetailsScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      slivers: [
        CustomSliverAppBar(
            image: MealCubit.get(context).mealModel!.strMealThumb!,
            height: AppConstant.deviceHeight(context) / 2.5),
        CustomSliverToBoxAdapter(
          widget: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NameAndRatePart(
                  mealName: MealCubit.get(context).mealModel!.strMeal!,
                  category: MealCubit.get(context).mealModel!.strCategory!,
                ),
                Gap(15.h),
                const MoreDetails(),
                Gap(15.h),
                IngredientItem(
                    ingredient: AppLocalizations.of(context)!.ingredients),
                Gap(15.h),
                TableOfIngredients(
                    ingredients: MealCubit.get(context).mealModel!.ingredients!,
                    measurements:
                        MealCubit.get(context).mealModel!.measurements!),
                Gap(15.h),
                IngredientItem(
                    ingredient: AppLocalizations.of(context)!.directions),
                Gap(10.h),
                Text(
                  MealCubit.get(context).mealModel!.strInstructions!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                      fontSize:
                          getResponsiveFontSize(context, fontSize: 13.sp)),
                ),
                Gap(15.h),
                WatchAndBookmarkButtons(
                  mealModel: MealCubit.get(context).mealModel!,
                  link: MealCubit.get(context).mealModel!.strYoutube!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
