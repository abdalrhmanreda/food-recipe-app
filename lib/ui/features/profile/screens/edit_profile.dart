// import 'package:easy_parking_app/core/user/components/custom_text_form_feild.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:iconly/iconly.dart';
//
// import '../../../../../../config/colors/app_colors.dart';
// import '../../../../../../core/user/components/custom_button.dart';
// import '../../../authentication/components/register/bulid_text_form_feild_register_screen.dart';
// import '../components/bulid_profile_photo_stack.dart';
//
// class EditProfile extends StatelessWidget {
//   const EditProfile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             bulidProfilePhotoStack(),
//             Gap(15.h),
//             bulidTextFormFeildRegisterScreen(
//               context,
//               TextEditingController(),
//               TextEditingController(),
//               TextEditingController(),
//               TextEditingController(),
//             ),
//             CustomTextFormField(
//               type: TextInputType.text,
//               isPassword: false,
//               maxLine: 1,
//               controller: TextEditingController(),
//               label: 'Location',
//               prefixIcon: IconlyBroken.location,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               edgeInsetsGeometry: EdgeInsets.symmetric(
//                 vertical: 15.h,
//               ),
//             ),
//             Gap(15.h),
//             CustomButton(
//               text: 'Save',
//               onPressed: () {},
//               color: AppColors.kPrimaryColor,
//               textColor: AppColors.kWhiteColor,
//               fontSize: 18.sp,
//               height: 37.h,
//               width: MediaQuery.of(context).size.width,
//               vertical: 15.h,
//               horizontal: 0,
//               radius: 15,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
