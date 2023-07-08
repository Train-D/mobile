import 'package:basic_utils/basic_utils.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'reset_password_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import 'register_screen.dart';
import '../../../layout/presentation/screens/home_screen.dart';

import '../components/auth_components.dart';
import '../controller/login_cubit/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);

      if (state is LoginSuccessState) {
        SharedComponents.navigateToReplace(
          const HomeScreen(),
          context,
        );
        SharedComponents.showToast(
          text: cubit.authresponseModel.message,
          color: Colors.green,
        );
        cubit.loginClearData();
      }
      if(state is LoginErrorState){
        SharedComponents.showToast(
          text: cubit.authresponseModel.message,
          color: Colors.red,
        );
      }
    }, builder: (context, state) {
      LoginCubit cubit = LoginCubit.get(context);
      return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child:
      SharedComponents.screenBg(
        imageUrl: '${AppConstants.imagesUrl}$loginBg',
        context: context,
        child: Scaffold(
          backgroundColor: transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  AppString.loginTitle,
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.sp,
                  ),
                  child: Form(
                    key: cubit.loginFormKey,
                    autovalidateMode: cubit.loginAutoValidationMode,
                    child: Column(
                      children: [
                        SharedComponents.defaultTextField(
                          controller: cubit.loginUsernameCon,
                          type: TextInputType.text,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'This field must not be empty';
                            }
                            return null;
                          },
                          label: AppString.userName,
                          radius: AppSizes.textFormFieldRadius,
                          bgColor: textFormBgColor,
                          textColor: textFormTextColor,
                        ),
                        SizedBox(
                          height: AppSizes.spaceBetweenFields,
                        ),
                        SharedComponents.defaultTextField(
                          controller: cubit.loginPasswordCon,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'This field must not be empty';
                            }
                            return null;
                          },
                          label: AppString.passowrd,
                          radius: AppSizes.textFormFieldRadius,
                          bgColor: textFormBgColor,
                          textColor: textFormTextColor,
                          password: cubit.loginPasswordShown,
                          suffIconFound: true,
                          suffIcon: cubit.loginSuffIcon,
                          suffPressed: () {
                            cubit.changePasswordVisibility();
                          },
                        ),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SharedComponents.defaultTextButton(
                                function: () {
                                  FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                  SharedComponents.navigateTo(
                                      ResetPasswordScreen(), context);
                                },
                                text: AppString.forgotPassword,
                                context: context,
                                size: 15)
                          ],
                        ),
                        
                              SharedComponents.defaultButton(
                            context: context,
                            function: () async {
                              FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                              if (cubit.loginFormKey.currentState!
                                  .validate()) {
                                await cubit.login(
                                  userName: cubit.loginUsernameCon.text,
                                  password: cubit.loginPasswordCon.text,
                                );
                              } else {
                                cubit.loginChangeAutoValidationMode();
                              }
                            },
                            
                            text: state is LoginLoadingState? Center(child: CircularProgressIndicator(),):
                                StringUtils.capitalize(AppString.loginTitle),
                            width: AppSizes.width(context) / 3,
                            height: AppSizes.height(context) / 14,
                            radius: AppSizes.defaultBottomRadius,
                            isLoading: state is LoginLoadingState? true : false
                          ),
                          
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                AppString.haveAccount,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 16.sp,
                                    ),
                              ),
                            ),
                            SharedComponents.defaultTextButton(
                              function: () {
                                FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                SharedComponents.navigateTo(
                                  const SignUpScreen(),
                                  context,
                                );
                                cubit.loginClearData();
                              },
                              text: AppString.signUpTitle,
                              context: context,
                            ),
                          ],
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
    });
  }
}
