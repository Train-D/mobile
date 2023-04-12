import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/app_sizes.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/authentication/presentation/screens/login_screen.dart';
import '../components/auth_components.dart';
import '../controller/sign_up_cubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return SafeArea(
          child: SharedComponents.screenBg(
            imageUrl: '${AppConstants.imagesUrl}$signupBg',
            context: context,
            child: Scaffold(
              //resizeToAvoidBottomInset: false,
              backgroundColor: transparent,
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      AppString.signUpTitle,
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                            fontSize: 22.sp,
                          ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AuthComponents.signLogo(
                          raduis: AppSizes.socialLogoRaduis,
                          logoImage: google,
                          function: () {},
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        AuthComponents.signLogo(
                          raduis: AppSizes.socialLogoRaduis,
                          logoImage: facebook,
                          function: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.sp),
                      child: Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: SharedComponents.defaultTextField(
                                    controller: cubit.signUpFirstNameCon,
                                    type: TextInputType.text,
                                    validate: (e) {
                                      return null;
                                    },
                                    label: AppString.firstName,
                                    radius: AppSizes.textFormFieldRadius,
                                    bgColor: textFormBgColor,
                                    textColor: textFormTextColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Flexible(
                                  child: SharedComponents.defaultTextField(
                                    controller: cubit.signUpLastNameCon,
                                    type: TextInputType.text,
                                    validate: (e) {
                                      return null;
                                    },
                                    label: AppString.lasttName,
                                    radius: AppSizes.textFormFieldRadius,
                                    bgColor: textFormBgColor,
                                    textColor: textFormTextColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSizes.spaceBetweenFields,
                            ),
                            SharedComponents.defaultTextField(
                              controller: cubit.signUpEmailCon,
                              type: TextInputType.emailAddress,
                              validate: (e) {
                                return null;
                              },
                              label: AppString.email,
                              radius: AppSizes.textFormFieldRadius,
                              bgColor: textFormBgColor,
                              textColor: textFormTextColor,
                            ),
                            SizedBox(
                              height: AppSizes.spaceBetweenFields,
                            ),
                            SharedComponents.defaultTextField(
                              controller: cubit.signUpPasswordCon,
                              type: TextInputType.visiblePassword,
                              validate: (e) {
                                return null;
                              },
                              label: AppString.passowrd,
                              radius: AppSizes.textFormFieldRadius,
                              bgColor: textFormBgColor,
                              textColor: textFormTextColor,
                              password: cubit.signUpPasswordShown,
                              suffIconFound: true,
                              suffIcon: cubit.signUpSuffIcon,
                              suffPressed: () {
                                cubit.changePasswordVisibility();
                              },
                            ),
                            SizedBox(
                              height: AppSizes.spaceBetweenFields,
                            ),
                            SharedComponents.defaultButton(
                              context: context,
                              function: () {
                                SharedComponents.navigateToReplace(
                                  const LoginScreen(),
                                  context,
                                );
                              },
                              text:
                                  StringUtils.capitalize(AppString.signUpTitle),
                              width: AppSizes.width(context) / 3,
                              height: AppSizes.height(context) / 14,
                              radius: AppSizes.defaultBottomRadius,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Colum
            ),
          ),
        );
      },
    );
  }
}
