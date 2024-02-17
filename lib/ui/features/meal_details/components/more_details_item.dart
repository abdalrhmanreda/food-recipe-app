import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';

class MoreDetailsItem extends StatelessWidget {
  const MoreDetailsItem({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
          height: 110.h,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          width: AppConstant.deviceWidth(context) / 5,
          decoration: BoxDecoration(
            color: const Color(AppColors.kPrimaryColor),
            borderRadius: BorderRadius.circular(45.r),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundColor: const Color(AppColors.kWhiteColor),
                child: Icon(
                  icon,
                  color: const Color(AppColors.kBlackColor),
                  size: 35,
                ),
              ),
              Gap(5.h),
              Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: const Color(AppColors.kWhiteColor),
                      fontWeight: FontWeight.w500,
                      fontSize: getResponsiveFontSize(context, fontSize: 15.sp),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
