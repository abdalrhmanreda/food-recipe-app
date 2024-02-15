import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../config/colors/app_colors.dart';
import '../../../../../config/routes/routes_path.dart';
import '../../../../../core/components/custom_button.dart';
import '../../../../../core/components/custom_navigatation.dart';
import '../../../../../core/components/progress_indector.dart';
import '../../../../../core/constant/app_constant.dart';
import '../../../../../core/methods/get_responsive_text/responsive_text.dart';
import '../../controller/auth_cubit.dart';
import '../common/build_text_next_to_text_button.dart';
import '../common/build_two_text_form_field.dart';
import '../common/sign_with_google.dart';

class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is GetUserDataSuccessState) {
          // showToast(message: 'Login successfully', state: ToastState.SUCCESS);
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
                        AppLocalizations.of(context)!.loginScreenTitlePartOne,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: getResponsiveFontSize(context,
                                  fontSize: 25.sp),
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.loginDesc,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              fontSize: getResponsiveFontSize(context,
                                  fontSize: 15.sp),
                            ),
                        textAlign: TextAlign.start,
                      ),
                      const Gap(30),
                      const SignWithGoogle(),
                      Gap(40.h),
                      CustomTwoTextFromField(
                        controller1: emailController,
                        controller2: passController,
                        hint1: AppLocalizations.of(context)!.email,
                        hint2: AppLocalizations.of(context)!.password,
                      ),
                      const Gap(15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          AppLocalizations.of(context)!.loginScreenForgetPass,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: const Color(AppColors.kGreyColor),
                                    fontSize: getResponsiveFontSize(context,
                                        fontSize: 14.sp),
                                  ),
                        ),
                      ),
                      const Gap(20),
                      ConditionalBuilder(
                          condition: state is! LoadingState,
                          builder: (context) => CustomButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    AuthCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passController.text);
                                  }
                                },
                                text: AppLocalizations.of(context)!
                                    .loginScreenButton,
                                height: 37.h,
                                color: AppColors.kPrimaryColor,
                                width: AppConstant.deviceWidth(context),
                                horizontal: 0,
                                vertical: 0,
                                radius: 10,
                                textColor: AppColors.kWhiteColor,
                                fontSize: getResponsiveFontSize(context,
                                    fontSize: 18.sp),
                              ),
                          fallback: (context) =>
                              const CustomLoadingIndicator()),
                      const Gap(25),
                      customTextNextToTextButton(
                        context: context,
                        text: AppLocalizations.of(context)!
                            .loginScreenHaveNotAccount,
                        textButton: AppLocalizations.of(context)!
                            .loginScreenCreateAccount,
                        onPressed: () {
                          CustomNavigation.navigateByNamedTo(
                              context, RoutePath.signUp);
                        },
                      ),
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
