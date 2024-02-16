import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/components/custom_button.dart';
import '../../../../core/constant/app_constant.dart';
import '../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../../../generated/assets.dart';

class Poster extends StatelessWidget {
  const Poster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Container(
          height: 150.h,
          width: AppConstant.deviceWidth(context),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            image: DecorationImage(
              image: AssetImage(Assets.onBoardingMealTwo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 150.h,
          padding: const EdgeInsets.all(15),
          constraints: BoxConstraints(
            maxWidth: AppConstant.deviceWidth(context) / 1.5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.posterTitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(AppColors.kWhiteColor),
                      fontSize: getResponsiveFontSize(
                        context,
                        fontSize: 20.sp,
                      ),
                    ),
              ),
              Gap(5.h),
              CustomButton(
                onPressed: () {},
                text: AppLocalizations.of(context)!.posterButton,
                width: 100.w,
                height: 30.h,
                radius: 15.r,
                color: (AppColors.kPrimaryColor),
                textColor: AppColors.kWhiteColor,
                vertical: 2.h,
                horizontal: 2.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
