import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fast_food/core/components/progress_indector.dart';
import 'package:fast_food/ui/features/meal_details/controller/meal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/meal_details_body.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MealCubit, MealState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: ConditionalBuilder(
            condition: state is! MealLoading,
            builder: (context) => const MealDetailsScreenBody(),
            fallback: (context) => const CustomLoadingIndicator(),
          ),
        );
      },
    );
  }
}
