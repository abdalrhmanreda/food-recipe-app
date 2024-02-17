import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constant/app_constant.dart';

class CustomFlexibleSpaceBar extends StatelessWidget {
  const CustomFlexibleSpaceBar({
    super.key,
    required this.image,
    required this.height,
  });

  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: CachedNetworkImage(
        imageUrl: image,
        width: AppConstant.deviceWidth(context),
        fit: BoxFit.cover,
      ),
    );
  }
}
