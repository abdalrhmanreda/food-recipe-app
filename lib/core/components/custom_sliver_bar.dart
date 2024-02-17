import 'package:fast_food/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../constant/app_constant.dart';
import 'custom_divider.dart';
import 'custom_flexible_space.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.image,
    required this.height,
  });
  final String image;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.hardEdge,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      expandedHeight: height,
      leading: Padding(
        padding: const EdgeInsets.all(6.0),
        child: CircleAvatar(
          backgroundColor: const Color(AppColors.klightGrey),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Iconsax.arrow_left_2_outline,
                size: 28,
                color: Color(AppColors.kPrimaryColor),
              ),
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.h),
          child: Container(
            alignment: Alignment.center,
            width: AppConstant.deviceWidth(context),
            height: 30.h,
            decoration: BoxDecoration(
              color: const Color(AppColors.kWhiteColor),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: myDivider(50.w, 3.h),
          )),
      automaticallyImplyLeading: true,
      flexibleSpace: CustomFlexibleSpaceBar(
        height: height,
        image: image,
      ),
    );
  }
}
