import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/custom_divider.dart';
import 'bulid_profile_items.dart';
import 'bulid_profile_photo_stack.dart';
import 'bulid_texts_and_button.dart';

class BuildProfileScreenBody extends StatelessWidget {
  const BuildProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 50,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            bulidProfilePhotoStack(context),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            bulidTextsAndButton(context),
            myDivider(MediaQuery.of(context).size.width, 1.h),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            bulidProfileItems(context),
          ],
        ),
      ),
    );
  }
}
