import 'package:fast_food/core/methods/get_responsive_text/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../image_part.dart';
import 'on_boarding_item_content/on_boarding_item_content.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingItemContent onBoardingItemContent;

  const OnBoardingItem({
    Key? key,
    required this.onBoardingItemContent,
    required BuildContext context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.2,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        textBaseline: TextBaseline.alphabetic,
        children: [
          ImagePart(onBoardingItemContent: onBoardingItemContent),
          Text(
            onBoardingItemContent.title,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: getResponsiveFontSize(context, fontSize: 19.sp),
                  fontWeight: FontWeight.bold,
                ),
          ),
          Gap(15.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: Text(
              onBoardingItemContent.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: getResponsiveFontSize(context, fontSize: 14.sp),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
