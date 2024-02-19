import 'package:fast_food/ui/features/bookmark/controllers/bookmark_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../../config/colors/app_colors.dart';

class BookMarkIcon extends StatelessWidget {
  const BookMarkIcon();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookmarkCubit, BookmarkState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: Color(AppColors.klightGrey),
                child: Icon(
                  IconlyBroken.bookmark,
                  color: Color(AppColors.kPrimaryColor),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
