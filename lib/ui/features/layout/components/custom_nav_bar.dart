import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:fast_food/config/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/layout_cubit.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return CustomNavigationBar(
          isFloating: true,
          selectedColor: const Color(AppColors.kPrimaryColor),
          strokeColor: const Color(AppColors.kPrimaryColor),
          borderRadius: Radius.circular(15.r),
          currentIndex: LayoutCubit.get(context).currentIndex,
          onTap: (index) {
            LayoutCubit.get(context).changeIndex(index);
          },
          items: LayoutCubit.get(context).items,
        );
      },
    );
  }
}
