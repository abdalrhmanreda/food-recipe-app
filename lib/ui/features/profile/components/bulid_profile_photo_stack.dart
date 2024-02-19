import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_food/ui/features/authentication/controller/auth_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../../config/colors/app_colors.dart';

Stack bulidProfilePhotoStack(context) {
  return Stack(
    alignment: AlignmentDirectional.bottomEnd,
    children: [
      CircleAvatar(
        radius: 70.0,
        backgroundImage: CachedNetworkImageProvider(
            AuthCubit.get(context).userModel!.profileImage!),
      ),
      const CircleAvatar(
        backgroundColor: Color(AppColors.kPrimaryColor),
        radius: 20.0,
        child: Icon(
          Icons.camera_alt,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    ],
  );
}
