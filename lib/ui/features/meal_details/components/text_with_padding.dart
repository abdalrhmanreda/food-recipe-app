import 'package:fast_food/core/methods/get_responsive_text/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextWithPadding extends StatelessWidget {
  const TextWithPadding(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSize,
      this.fontWeight});
  final String text;
  final int color;
  final double fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Color(color),
            fontWeight: fontWeight,
            fontSize: getResponsiveFontSize(context, fontSize: fontSize.sp)),
      ),
    );
  }
}
