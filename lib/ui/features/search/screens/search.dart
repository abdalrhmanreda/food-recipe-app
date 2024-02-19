import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fast_food/config/colors/app_colors.dart';
import 'package:fast_food/core/components/custom_app_bar.dart';
import 'package:fast_food/core/components/progress_indector.dart';
import 'package:fast_food/ui/features/search/controller/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/routes/routes_path.dart';
import '../../../../core/components/custom_navigatation.dart';
import '../../authentication/components/common/container_with_text_from_feild.dart';
import '../../meal_details/controller/meal_cubit.dart';
import '../../meals_of_specific_category/components/meals_of_specific_category_list_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            color: AppColors.kWhiteColor,
            title: Text(AppLocalizations.of(context)!.search),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                ContainerTextFormFeild(
                  isPass: false,
                  controller: SearchCubit.get(context).searchController,
                  hint: AppLocalizations.of(context)!.search,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (SearchCubit.get(context).searchController.text.length <=
                        1) {
                      SearchCubit.get(context).searchByLetter(
                          query:
                              SearchCubit.get(context).searchController.text);
                    } else {
                      SearchCubit.get(context).searchByWord(
                          query:
                              SearchCubit.get(context).searchController.text);
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ConditionalBuilder(
                  condition: state is! SearchLoading,
                  builder: (context) {
                    return Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              CustomNavigation.navigateByNamedTo(
                                  context, RoutePath.mealDetails);
                              MealCubit.get(context).getMealDetails(
                                  id: SearchCubit.get(context)
                                      .searchList[index]
                                      .idMeal!);
                            },
                            child: MealsOfSpecificCategoryListItem(
                              mealImage: SearchCubit.get(context)
                                  .searchList[index]
                                  .strMealThumb!,
                              mealName: SearchCubit.get(context)
                                  .searchList[index]
                                  .strMeal!,
                              mealTime: '20 min',
                              mealArea: SearchCubit.get(context)
                                  .searchList[index]
                                  .strArea!,
                              mealCategory: SearchCubit.get(context)
                                  .searchList[index]
                                  .strCategory!,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Gap(10.h),
                        itemCount: SearchCubit.get(context).searchList.length,
                      ),
                    );
                  },
                  fallback: (BuildContext context) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 35.0.h),
                    child: const CustomLoadingIndicator(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
