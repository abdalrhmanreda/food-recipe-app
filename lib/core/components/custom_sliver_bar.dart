import 'package:flutter/material.dart';

import 'custom_flexible_space.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.image,
    required this.height,
  });
  final String image;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      expandedHeight: height,
      automaticallyImplyLeading: true,
      flexibleSpace: CustomFlexibleSpaceBar(
        image: image,
      ),
    );
  }
}
