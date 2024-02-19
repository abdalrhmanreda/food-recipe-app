import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

import '../../config/colors/app_colors.dart';
//
// enum ToastState { SUCCESS, ERROR, WARNING }
//
// void showToast({
//   required String message,
//   required ToastState state,
// }) =>
//     Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: stateColor(state),
//         textColor: Colors.white,
//         fontSize: 16.0);
//
// Color stateColor(ToastState state) {
//   Color? color;
//   switch (state) {
//     case ToastState.SUCCESS:
//       color = Colors.green;
//       break;
//     case ToastState.ERROR:
//       color = Colors.red;
//       break;
//     case ToastState.WARNING:
//       color = Colors.amber;
//       break;
//   }
//   return color;
// }

void showNotificationToast({
  required BuildContext context,
  required String message,
  required String title,
  required ToastificationStyle style,
  IconData? icon,
  bool? mistake,
}) =>
    toastification.show(
      context: context,
      style: style,
      borderRadius: BorderRadius.circular(15.r),
      title: Text(title, style: TextStyle(fontSize: 16.sp)),
      description: Text(message),
      icon: icon == null
          ? null
          : Icon(
              icon,
              color:
                  mistake! ? Colors.red : const Color(AppColors.kPrimaryColor),
              size: 30.sp,
            ),
      primaryColor:
          mistake! ? Colors.red : const Color(AppColors.kPrimaryColor),
      applyBlurEffect: true,
      alignment: Alignment.topRight,
    );
