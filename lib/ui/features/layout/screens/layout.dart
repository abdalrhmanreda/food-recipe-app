import 'package:fast_food/ui/features/layout/controller/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/custom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: LayoutCubit.get(context)
              .screens[LayoutCubit.get(context).currentIndex],
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10.h,
            ),
            child: const CustomNavBar(),
          ),
        );
      },
    );
  }
}
