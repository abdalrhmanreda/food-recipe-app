import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:fast_food/ui/features/fav/screens/fav_screen.dart';
import 'package:fast_food/ui/features/home/screens/home_screen.dart';
import 'package:fast_food/ui/features/search/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../profile/screens/profile_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<CustomNavigationBarItem> items = [
    CustomNavigationBarItem(
      icon: const Icon(Iconsax.home_outline),
    ),
    CustomNavigationBarItem(
      icon: const Icon(IconlyBroken.search),
    ),
    CustomNavigationBarItem(
      icon: const Icon(IconlyBroken.bookmark),
    ),
    CustomNavigationBarItem(
      icon: const Icon(IconlyBroken.profile),
    ),
  ];
  List<Widget> screens = const [
    HomeScreen(),
    SearchScreen(),
    FavScreen(),
    ProfileScreen()
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
}
