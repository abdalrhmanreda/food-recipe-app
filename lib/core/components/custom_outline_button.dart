import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/app_colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0.r), // Set border radius to 15
            side: const BorderSide(
              color: Color(AppColors.kPrimaryColor),
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      onPressed: () {
        onPressed(); // Call onPressed function when the button is pressed
      },
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: const Color(AppColors.kPrimaryColor),
            ),
      ),
    );
  }
}
