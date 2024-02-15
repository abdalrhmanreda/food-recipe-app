import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../controller/auth_cubit.dart';
import 'container_with_text_from_feild.dart';

class CustomTwoTextFromField extends StatefulWidget {
  const CustomTwoTextFromField({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.hint1,
    required this.hint2,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;
  final String hint1;
  final String hint2;

  @override
  State<CustomTwoTextFromField> createState() => _CustomTwoTextFromFieldState();
}

class _CustomTwoTextFromFieldState extends State<CustomTwoTextFromField> {
  bool isPass = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerTextFormFeild(
              isPass: false,
              controller: widget.controller1,
              hint: widget.hint1,
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(20.h),
            ContainerTextFormFeild(
              isPass: isPass,
              controller: widget.controller2,
              hint: widget.hint2,
              keyboardType: TextInputType.visiblePassword,
              suffixIcon:
                  isPass ? Iconsax.eye_outline : Iconsax.eye_slash_outline,
              suffixPressed: () {
                setState(() {
                  isPass = !isPass;
                });
                // AuthCubit.get(context).changePasswordIcon(isPass2);
              },
            ),
          ],
        );
      },
    );
  }
}
