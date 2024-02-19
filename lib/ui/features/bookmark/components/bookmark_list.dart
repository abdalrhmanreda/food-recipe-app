import 'package:fast_food/core/components/custom_divider.dart';
import 'package:fast_food/core/constant/app_constant.dart';
import 'package:fast_food/ui/features/bookmark/controllers/bookmark_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/bookmark_item.dart';

class BookmarkList extends StatelessWidget {
  const BookmarkList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(10.h),
              child: BookmarkItem(
                model: BookmarkCubit.get(context).bookmarkList[index],
              ),
            ),
        separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: myDivider(AppConstant.deviceWidth(context), 1.h),
            ),
        itemCount: BookmarkCubit.get(context).bookmarkList.length);
  }
}
