import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/app_constant.dart';

class CustomFlexibleSpaceBar extends StatelessWidget {
  const CustomFlexibleSpaceBar({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Container(
        padding: const EdgeInsets.all(15),
        width: AppConstant.deviceWidth(context),
        height: AppConstant.deviceHeight(context) / 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              image,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
