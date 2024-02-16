import 'package:flutter/material.dart';

import '../../../../config/colors/app_colors.dart';
import '../components/on_boarding/on_boarding_screen_body.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(AppColors.kWhiteColor),
      body: OnBoardingScreenBody(),
    );
  }
}
