import 'package:fast_food/config/colors/app_colors.dart';
import 'package:fast_food/core/components/custom_app_bar.dart';
import 'package:fast_food/core/components/progress_indector.dart';
import 'package:fast_food/ui/features/bookmark/controllers/bookmark_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:toastification/toastification.dart';

import '../../../../core/components/flutter_toast.dart';
import '../components/bookmark_list.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var lottie =
        'https://lottie.host/0621b296-7a0c-4e78-95fa-6556ac7932c8/uQlQUHz62D.json';
    return BlocConsumer<BookmarkCubit, BookmarkState>(
      listener: (context, state) {
        if (state is RemoveAllBookmark) {
          showNotificationToast(
            mistake: true,
            message: 'You  have removed all bookmark ',
            style: ToastificationStyle.fillColored,
            title: 'Remove from bookmark',
            context: context,
            icon: Iconsax.trash_outline,
          );
        } else if (state is BookmarkRemoved) {
          showNotificationToast(
            mistake: true,
            message: 'You removed ${state.meal.strMeal!} from your bookmark',
            style: ToastificationStyle.fillColored,
            title: 'Removed from bookmark',
            context: context,
            icon: Icons.check_circle_outlined,
          );
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: Text(AppLocalizations.of(context)!.bookmark),
            color: AppColors.kWhiteColor,
            actions: [
              IconButton(
                onPressed: () {
                  BookmarkCubit.get(context).removeAllBookmark();
                },
                icon: const Icon(Iconsax.trash_outline),
              ),
            ],
          ),
          body: state is BookmarkLoading
              ? const CustomLoadingIndicator()
              : BookmarkCubit.get(context).bookmarkList.isEmpty
                  ? Lottie.network(lottie)
                  : const BookmarkList(),
        );
      },
    );
  }
}
