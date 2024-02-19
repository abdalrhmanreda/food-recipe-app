import 'package:fast_food/ui/features/authentication/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../model/profile_item.dart';

List<ProfileItem> items(context) => [
      ProfileItem(
        icon: IconlyBroken.setting,
        title: 'Settings',
        onTap: () {},
      ),
      ProfileItem(
        icon: IconlyBroken.notification,
        title: 'Notification',
        onTap: () {},
      ),
      ProfileItem(
        icon: Icons.translate_outlined,
        title: 'Language',
        onTap: () {},
      ),
      ProfileItem(
        icon: Icons.help_outline_sharp,
        title: 'Center Help',
        onTap: () {},
      ),
      ProfileItem(
        icon: IconlyBroken.logout,
        title: 'Logout',
        onTap: () {
          AuthCubit.get(context).logout();
        },
      ),
    ];
