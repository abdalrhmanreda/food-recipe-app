import 'package:fast_food/config/routes/routes_path.dart';
import 'package:fast_food/ui/features/layout/screens/layout.dart';
import 'package:fast_food/ui/features/meal_details/screens/meal_details_screen.dart';
import 'package:fast_food/ui/features/on_boarding/screens/on_boarding_screen.dart';
import 'package:fast_food/ui/features/profile/screens/edit_profile.dart';
import 'package:flutter/material.dart';

import '../../ui/features/authentication/screens/login_screen/login_screen.dart';
import '../../ui/features/authentication/screens/register_screen/register_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case RoutePath.onBoarding:
      return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
    case RoutePath.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case RoutePath.signUp:
      return MaterialPageRoute(builder: (_) => const RegisterScreen());
    case RoutePath.layout:
      return MaterialPageRoute(builder: (_) => const LayoutScreen());
    case RoutePath.mealDetails:
      return MaterialPageRoute(builder: (_) => const MealDetailsScreen());
    case RoutePath.editProfile:
      return MaterialPageRoute(builder: (_) => const EditProfileScreen());
  }
  return null;
}
