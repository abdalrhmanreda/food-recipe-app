import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_food/config/colors/app_colors.dart';
import 'package:fast_food/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class MealsOfSpecificCategoryListItem extends StatelessWidget {
  const MealsOfSpecificCategoryListItem({
    super.key,
    required this.mealImage,
    required this.mealName,
    required this.mealTime,
    required this.mealCategory,
  });
  final String mealImage;
  final String mealName;
  final String mealTime;
  final String mealCategory;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: AppConstant.deviceWidth(context),
          height: 150.h,
          margin: EdgeInsets.all(5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: CachedNetworkImageProvider(mealImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 150.h,
          constraints: BoxConstraints(
            maxWidth: AppConstant.deviceWidth(context) / 2,
          ),
          margin: EdgeInsets.all(5.h),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
          width: AppConstant.deviceWidth(context) / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
                Colors.black.withOpacity(0.8),
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(1),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mealName,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(AppColors.kWhiteColor),
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 16.sp,
                        ),
                      )),
              Gap(10.h),
              Text(mealCategory,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(AppColors.kWhiteColor),
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 14.sp,
                        ),
                      )),
              Gap(10.h),
              Row(
                children: [
                  const Icon(
                    IconlyBroken.timeCircle,
                    color: Color(AppColors.kWhiteColor),
                    size: 22,
                  ),
                  Gap(5.w),
                  Text(mealTime,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: const Color(AppColors.kWhiteColor),
                            fontSize: getResponsiveFontSize(
                              context,
                              fontSize: 13.sp,
                            ),
                          )),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
