import 'package:fast_food/config/colors/app_colors.dart';
import 'package:fast_food/core/methods/get_responsive_text/responsive_text.dart';
import 'package:fast_food/ui/features/home/components/category_list.dart';
import 'package:fast_food/ui/features/home/components/poster.dart';
import 'package:fast_food/ui/features/home/controllers/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 25.h,
        left: 15,
        right: 15,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context)!.homeTitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: getResponsiveFontSize(
                      context,
                      fontSize: 20.sp,
                    ))),
            Gap(5.h),
            Text(
              AppLocalizations.of(context)!.homeTitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: const Color(AppColors.kGreyColor),
                  fontSize: getResponsiveFontSize(
                    context,
                    fontSize: 15.sp,
                  )),
            ),
            Gap(15.h),
            const Poster(),
            Gap(15.h),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: HomeCubit.get(context).categories.length,
              itemBuilder: (context, index) {
                String category = HomeCubit.get(context).categories[index];

                if (category.toLowerCase() == 'goat') {
                  // Skip designing for 'goat'
                  return Container(); // You can also return null
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CategoryList(
                    list: HomeCubit.get(context)
                        .getCategoryListForCategory(category, context),
                    category: category,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
