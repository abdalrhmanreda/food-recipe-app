import 'package:fast_food/core/constant/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class NameAndRatePart extends StatelessWidget {
  const NameAndRatePart({
    super.key,
    required this.mealName,
    required this.category,
  });
  final String mealName;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: AppConstant.deviceWidth(context) / 2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mealName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(AppColors.kBlackColor),
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 17.sp,
                        ),
                      )),
              Gap(5.h),
              Text(category,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: const Color(AppColors.kGreyColor),
                        fontSize: getResponsiveFontSize(
                          context,
                          fontSize: 14.sp,
                        ),
                      )),
            ],
          ),
        ),
        Container(
          width: 70.w,
          height: 30.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Iconsax.star_bold,
                color: Color(AppColors.kWhiteColor),
              ),
              Gap(5.w),
              const Text(
                '4.5',
                style: TextStyle(color: Color(AppColors.kWhiteColor)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
