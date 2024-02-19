import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../../config/colors/app_colors.dart';
import '../../../../../../core/components/custom_button.dart';
import '../../../../../../core/constant/app_constant.dart';
import '../../../../../config/routes/routes_path.dart';
import '../../../../../core/components/custom_navigatation.dart';
import '../../../../../core/components/progress_indector.dart';
import '../../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../controller/auth_cubit.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';
import '../common/sign_with_google.dart';
import 'full_name.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is GetUserDataSuccessState) {
          // showToast(
          //   message: 'Created account successfully',
          //   state: ToastState.SUCCESS,
          // );
          // ApiConstant.token = state.token;
          CustomNavigation.navigateByNamedTo(context, RoutePath.layout);
        } else if (state is FailureState) {
          // showToast(message: state.error, state: ToastState.ERROR);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: AppConstant.deviceHeight(context),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.getStarted,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: getResponsiveFontSize(context,
                                  fontSize: 25.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Gap(10.h),
                      Text(
                        AppLocalizations.of(context)!.createAccount,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              fontSize: getResponsiveFontSize(context,
                                  fontSize: 15.sp),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(30),
                      const SignWithGoogle(),
                      Gap(40.h),
                      TitleAndTextFormFeild(
                        nameController: AuthCubit.get(context).nameController,
                        hint: AppLocalizations.of(context)!.userName,
                      ),
                      Gap(20.h),
                      CustomTwoTextFromField(
                        controller1: AuthCubit.get(context).emailController,
                        controller2: AuthCubit.get(context).passController,
                        hint1: AppLocalizations.of(context)!.email,
                        hint2: AppLocalizations.of(context)!.password,
                      ),
                      const Gap(30),
                      ConditionalBuilder(
                        condition: state is! LoadingState,
                        builder: (context) => CustomButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthCubit.get(context).userRegister();
                            }
                          },
                          text: AppLocalizations.of(context)!.signUp,
                          height: 37.h,
                          color: AppColors.kPrimaryColor,
                          width: AppConstant.deviceWidth(context),
                          horizontal: 0,
                          vertical: 0,
                          radius: 10,
                          textColor: AppColors.kWhiteColor,
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 20.sp),
                        ),
                        fallback: (context) => const CustomLoadingIndicator(),
                      ),
                      const Gap(20),
                      customTextNextToTextButton(
                          context: context,
                          text: AppLocalizations.of(context)!
                              .registerScreenHaveAccount,
                          textButton:
                              AppLocalizations.of(context)!.loginScreenButton,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
