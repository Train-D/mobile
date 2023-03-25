import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
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
        return SharedComponents.screenBg(
          imageUrl: '${AppConstants.imagesUrl}$loginBg',
          context: context,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: transparent,
              body: Stack(
                children: [
                  AuthComponents.rectangleBg(image: rectangleTwoBg),
                  Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppString.signUpTitle,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
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
                                raduis: 15.sp,
                                logoImage: google,
                                function: () {},
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              AuthComponents.signLogo(
                                raduis: 15.sp,
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
                                        child:
                                            SharedComponents.defaultTextField(
                                          controller: cubit.signUpFirstNameCon,
                                          type: TextInputType.text,
                                          validate: (e) {
                                            return null;
                                          },
                                          label: AppString.firstName,
                                          radius: 30.sp,
                                          bgColor: textFormBgColor,
                                          textColor: textFormTextColor,
                                          focusedRadius: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Flexible(
                                        child:
                                            SharedComponents.defaultTextField(
                                          controller: cubit.signUpLastNameCon,
                                          type: TextInputType.text,
                                          validate: (e) {
                                            return null;
                                          },
                                          label: AppString.lasttName,
                                          radius: 30.sp,
                                          bgColor: textFormBgColor,
                                          textColor: textFormTextColor,
                                          focusedRadius: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SharedComponents.defaultTextField(
                                    controller: cubit.signUpEmailCon,
                                    type: TextInputType.emailAddress,
                                    validate: (e) {
                                      return null;
                                    },
                                    label: AppString.email,
                                    radius: 30.sp,
                                    bgColor: textFormBgColor,
                                    textColor: textFormTextColor,
                                    focusedRadius: true,
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SharedComponents.defaultTextField(
                                    controller: cubit.signUpPasswordCon,
                                    type: TextInputType.visiblePassword,
                                    validate: (e) {
                                      return null;
                                    },
                                    label: AppString.passowrd,
                                    radius: 30.sp,
                                    bgColor: textFormBgColor,
                                    textColor: textFormTextColor,
                                    focusedRadius: true,
                                    password: cubit.signUpPasswordShown,
                                    suffIcon: cubit.signUpSuffIcon,
                                    suffPressed: () {
                                      cubit.changePasswordVisibility();
                                    },
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  SharedComponents.defaultButton(
                                    context: context,
                                    function: () {
                                      SharedComponents.navigateToReplace(
                                          LoginScreen(), context);
                                    },
                                    text: StringUtils.capitalize(AppString.signUpTitle),
                                    width: AppConstants.width(context) / 3,
                                    height: AppConstants.height(context) / 14,
                                    radius: 4,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Colum
            ),
          ),
        );
      },
    );
  }
}
