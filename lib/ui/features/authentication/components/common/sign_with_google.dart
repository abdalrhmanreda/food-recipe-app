import 'package:fast_food/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/assets.dart';

class SignWithGoogle extends StatelessWidget {
  const SignWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundColor: Color(AppColors.klightGrey),
          child: Image.asset(
            Assets.iconsGoogle,
            width: 35.w,
            height: 35.h,
            fit: BoxFit.contain,
          ),
        ),
        CircleAvatar(
          radius: 25.r,
          backgroundColor: Color(AppColors.klightGrey),
          child: Image.asset(
            Assets.iconsFacebook,
            width: 25.w,
            height: 25.h,
            fit: BoxFit.contain,
          ),
        ),
        CircleAvatar(
          radius: 25.r,
          backgroundColor: Color(AppColors.klightGrey),
          child: Image.asset(
            Assets.iconsApple,
            width: 25.w,
            height: 25.h,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
