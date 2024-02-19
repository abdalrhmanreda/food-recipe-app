import 'package:fast_food/ui/features/authentication/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';

import '../../../../../../config/colors/app_colors.dart';

Column bulidTextsAndButton(BuildContext context) {
  return Column(
    children: [
      Text(
        AuthCubit.get(context).userModel!.name!,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
      ),
      Gap(7.h),
      Text(
        AuthCubit.get(context).userModel!.email!,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.grey,
              fontSize: 12.sp,
            ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
      Container(
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(AppColors.kPrimaryColor),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MaterialButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                IconlyBroken.edit,
                color: Colors.white,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 50,
              ),
              Text(
                'Edit Profile',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 13.sp,
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 50,
      ),
    ],
  );
}
