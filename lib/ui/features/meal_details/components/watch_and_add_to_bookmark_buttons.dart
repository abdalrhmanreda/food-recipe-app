import 'package:fast_food/config/colors/app_colors.dart';
import 'package:fast_food/core/components/custom_button.dart';
import 'package:fast_food/core/components/custom_outline_button.dart';
import 'package:fast_food/core/constant/app_constant.dart';
import 'package:fast_food/core/methods/url_lunch/url_lunch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchAndBookmarkButtons extends StatelessWidget {
  const WatchAndBookmarkButtons({
    super.key,
    required this.link,
  });
  final String link;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: AppConstant.deviceWidth(context) / 2.5,
          child: CustomOutlineButton(
              text: AppLocalizations.of(context)!.watchVideo,
              onPressed: () {
                launchUrlMethod(link: link);
              }),
        ),
        CustomButton(
          onPressed: () {},
          text: AppLocalizations.of(context)!.addToBookmark,
          color: AppColors.kPrimaryColor,
          textColor: AppColors.kWhiteColor,
          width: AppConstant.deviceWidth(context) / 2.5,
          height: 33.h,
          radius: 10.r,
          vertical: 0,
          horizontal: 0,
        ),
      ],
    );
  }
}
