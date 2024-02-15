import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    required this.color,
    this.isCenter,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final int color;
  final bool? isCenter;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(color),
      title: title,
      actions: actions,
      leading: leading,
      centerTitle: isCenter ?? false,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
