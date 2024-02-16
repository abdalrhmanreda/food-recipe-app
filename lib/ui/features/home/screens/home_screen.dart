import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fast_food/core/components/progress_indector.dart';
import 'package:fast_food/ui/features/home/controllers/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: ConditionalBuilder(
            condition: state is! HomeLoading &&
                HomeCubit.get(context).beef.isNotEmpty &&
                HomeCubit.get(context).chicken.isNotEmpty &&
                HomeCubit.get(context).lamb.isNotEmpty &&
                HomeCubit.get(context).pork.isNotEmpty &&
                HomeCubit.get(context).miscellaneous.isNotEmpty &&
                HomeCubit.get(context).pasta.isNotEmpty &&
                HomeCubit.get(context).seafood.isNotEmpty &&
                HomeCubit.get(context).side.isNotEmpty &&
                HomeCubit.get(context).vegetarian.isNotEmpty &&
                HomeCubit.get(context).vegan.isNotEmpty &&
                HomeCubit.get(context).starter.isNotEmpty &&
                HomeCubit.get(context).breakfast.isNotEmpty &&
                HomeCubit.get(context).dessert.isNotEmpty,
            builder: (context) => const HomeScreenBody(),
            fallback: (context) => const CustomLoadingIndicator(),
          ),
        );
      },
    );
  }
}
