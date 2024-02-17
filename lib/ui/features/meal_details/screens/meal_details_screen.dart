import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fast_food/core/components/custom_sliver_bar.dart';
import 'package:fast_food/core/components/custom_sliver_to_box_adapter.dart';
import 'package:fast_food/core/components/progress_indector.dart';
import 'package:fast_food/core/constant/app_constant.dart';
import 'package:fast_food/core/methods/get_responsive_text/responsive_text.dart';
import 'package:fast_food/ui/features/meal_details/controller/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../components/ingredient_item.dart';
import '../components/more_details.dart';
import '../components/name_and_rate_part.dart';
import '../components/table_of_ingrentients.dart';
import '../components/watch_and_add_to_bookmark_buttons.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealCubit, MealState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: ConditionalBuilder(
            condition: state is! MealLoading,
            builder: (context) => CustomScrollView(
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
                          category:
                              MealCubit.get(context).mealModel!.strCategory!,
                        ),
                        Gap(15.h),
                        const MoreDetails(),
                        Gap(15.h),
                        IngredientItem(
                            ingredient:
                                AppLocalizations.of(context)!.ingredients),
                        Gap(15.h),
                        TableOfIngredients(
                            ingredients:
                                MealCubit.get(context).mealModel!.ingredients!,
                            measurements: MealCubit.get(context)
                                .mealModel!
                                .measurements!),
                        Gap(15.h),
                        IngredientItem(
                            ingredient:
                                AppLocalizations.of(context)!.directions),
                        Gap(10.h),
                        Text(
                          MealCubit.get(context).mealModel!.strInstructions!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  height: 1.5,
                                  fontSize: getResponsiveFontSize(context,
                                      fontSize: 13.sp)),
                        ),
                        Gap(15.h),
                        WatchAndBookmarkButtons(
                          link: MealCubit.get(context).mealModel!.strYoutube!,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            fallback: (context) => const CustomLoadingIndicator(),
          ),
        );
      },
    );
  }
}
