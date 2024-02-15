import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import '../../../../core/constant/app_constant.dart';
import 'on_boarding/on_boarding_item_content/on_boarding_item_content.dart';

class ImagePart extends StatelessWidget {
  const ImagePart({
    super.key,
    required this.onBoardingItemContent,
  });

  final OnBoardingItemContent onBoardingItemContent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset(
            onBoardingItemContent.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.4,
            fit: BoxFit.cover,
          ),
          Container(
            width: AppConstant.deviceWidth(context),
            height: 50.h,
            decoration: BoxDecoration(
              color: const Color(AppColors.kWhiteColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  100.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
