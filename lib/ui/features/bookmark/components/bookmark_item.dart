import 'package:fast_food/ui/features/bookmark/controllers/bookmark_cubit.dart';
import 'package:fast_food/ui/features/meal_details/model/MealModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class BookmarkItem extends StatelessWidget {
  const BookmarkItem({
    super.key,
    required this.model,
  });
  final MealModel model;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: .2,
        children: [
          const Gap(5),
          SlidableAction(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            // An action can be bigger than the others.
            flex: 1,
            onPressed: (context) {
              BookmarkCubit.get(context).removeFromBookmark(meal: model);
            },
            borderRadius: BorderRadius.circular(8),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Iconsax.trash_outline,

            autoClose: false,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                image: NetworkImage(
                  model.strMealThumb!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gap(10.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.strMeal!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 16.sp,
                        ),
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Gap(10.h),
                Text(
                  model.strInstructions!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 14.sp,
                        ),
                      ),
                ),
                Gap(10.h),
                Row(
                  children: [
                    const Icon(IconlyBroken.timeCircle),
                    Gap(7.h),
                    Text(
                      '20 min',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 14.sp,
                            ),
                          ),
                    ),
                  ],
                ),
                Gap(10.h),
                Text(
                  model.strCategory!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 14.sp,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
