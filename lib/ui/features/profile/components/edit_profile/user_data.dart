import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../authentication/components/register/full_name.dart';

class UserData extends StatelessWidget {
  const UserData({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.addressController,
    required this.bioController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController addressController;
  final TextEditingController bioController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleAndTextFormFeild(
          nameController: nameController,
          hint: 'username',
        ),
        Gap(15.h),
        TitleAndTextFormFeild(
          nameController: emailController,
          hint: 'email address',
        ),
        Gap(15.h),
        TitleAndTextFormFeild(
          nameController: phoneController,
          hint: 'phone',
        ),
        Gap(15.h),
        TitleAndTextFormFeild(
          nameController: addressController,
          hint: 'address',
        ),
        Gap(15.h),
      ],
    );
  }
}
