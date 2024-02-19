import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../authentication/controller/auth_cubit.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 67.r,
              backgroundColor: const Color(AppColors.kGreyColor),
              child: CircleAvatar(
                backgroundImage: AuthCubit.get(context).profilePhoto != null
                    ? FileImage(AuthCubit.get(context).profilePhoto!)
                        as ImageProvider
                    : CachedNetworkImageProvider(
                        AuthCubit.get(context).userModel!.profileImage!),
                radius: 64.0.r,
              ),
            ),
            CircleAvatar(
              backgroundColor: const Color(AppColors.kPrimaryColor),
              child: IconButton(
                  onPressed: () {
                    AuthCubit.get(context).getProfileImage();
                  },
                  icon: const Icon(
                    Iconsax.camera_outline,
                    color: Color(AppColors.kWhiteColor),
                  )),
            )
          ],
        );
      },
    );
  }
}
