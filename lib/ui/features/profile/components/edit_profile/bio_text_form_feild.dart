import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/constant/app_constant.dart';

class BioTextFormFeild extends StatelessWidget {
  const BioTextFormFeild({
    super.key,
    required this.isPass,
    required this.controller,
    required this.hint,
    required this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixPressed,
    this.onChanged,
  });
  final bool isPass;
  final TextEditingController controller;
  final String hint;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? Function(String?)? onChanged;

  final VoidCallback? suffixPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Bio',
          style:
              Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15.sp),
        ),
        const Gap(10),
        Container(
          width: AppConstant.deviceWidth(context),
          height: 100.h,
          decoration: BoxDecoration(
            color: const Color(AppColors.kLoginWithGoogleColor),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            maxLines: null,
            controller: controller,
            obscureText: isPass,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
              border: InputBorder.none,
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 14.sp,
                    color: const Color(AppColors.kGreyColor),
                  ),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      onPressed: () {
                        suffixPressed?.call();
                      },
                      icon: Icon(
                        suffixIcon,
                        color: const Color(AppColors.kGreyColor),
                        size: 20,
                      ),
                    )
                  : null,
            ),
            keyboardType: keyboardType,
          ),
        ),
      ],
    );
  }
}
