import 'package:fast_food/config/routes/routes_path.dart';
import 'package:fast_food/core/components/custom_navigatation.dart';
import 'package:fast_food/ui/features/authentication/controller/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/colors/app_colors.dart';
import 'list_of_profile_item.dart';

Widget bulidProfileItems(BuildContext context) =>
    BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          CustomNavigation.navigateAndFinishNyNamed(context, RoutePath.login);
        }
        // TODO: implement listener
      },
      child: Column(
        children: items(context)
            .map(
              (e) => ListTile(
                title: Text(
                  e.title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 13.sp,
                      ),
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.green.withOpacity(.1),
                  child:
                      Icon(e.icon, color: const Color(AppColors.kPrimaryColor)),
                ),
                onTap: () {
                  e.onTap();
                },
              ),
            )
            .toList(),
      ),
    );
