import 'package:fast_food/config/colors/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../components/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        color: AppColors.kWhiteColor,
        title: Text(
          'Profile',
        ),
      ),
      body: ProfileScreenBody(),
    );
  }
}
