import 'package:basic_utils/basic_utils.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import '../../../../core/services/services_locator.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginCubit(sl(), sl()),
          ),
        ],
        child: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
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
            // cubit.loginClearData();
          }
          if (state is GetGoogleSignInTokenFromBackSuccessState) {
            //if (cubit.googleModel.message == 'login successfully') {
            CacheHelper.saveData(key: 'token', value: cubit.googleModel.token);
            SharedComponents.navigateToReplace(
              const HomeScreen(),
              context,
            );
            SharedComponents.showToast(
              text: 'Login Successfully',
              color: Colors.green,
            );
          }
          //}
          if (state is LoginErrorState) {
            SharedComponents.showToast(
              text: cubit.authresponseModel.message,
              color: Colors.red,
            );
          }
          if (state is GetGoogleSignInTokenFromBackFailureState) {
            SharedComponents.showAlertDialog(
                context: context,
                title: 'Error!',
                message: cubit.googleModel.message,
                actions: [
                  SharedComponents.defaultButton(
                      radius: 10.sp,
                      width: 20.w,
                      context: context,
                      function: () {
                        Navigator.pop(context);
                      },
                      text: 'Ok')
                ]);
          }
        }, builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SharedComponents.screenBg(
              imageUrl: '${AppConstants.imagesUrl}$loginBg',
              context: context,
              child: Scaffold(
                backgroundColor: transparent,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 27.h,
                      ),
                      Text(
                        AppString.loginTitle,
                        style:
                            Theme.of(context).textTheme.displayLarge!.copyWith(
                                  fontSize: 22.sp,
                                ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          state is GetGoogleSignInTokenFromBackLoadingState
                              ? const CircularProgressIndicator()
                              : AuthComponents.signLogo(
                                  content: 'Login With Google',
                                  context: context,
                                  raduis: AppSizes.socialLogoRaduis,
                                  logoImage: google,
                                  function: () async {
                                    var idToken =
                                        await AuthClass.googleSignIn(context);
                                    if (idToken != null) {
                                      await cubit.getGoogleSignInTokenFromBack(
                                          idToken);
                                      CacheHelper.saveData(
                                          key: 'googleToken', value: idToken);
                                      print('save google token to cache');
                                      CacheHelper.saveData(
                                          key: 'tempToken',
                                          value: cubit.googleModel.token);
                                    }
                                  },
                                ),
                        ],
                      ),
                      
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 3.h,
                        width: 65.w,
                        child: Padding(
                          padding:EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 22.w,
                                height: 0.1.h,
                                color: signLine,
                              ),
                              Text('OR', style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                color: cardTextCvvColor ,
                                fontSize: 16.sp
                              ),),
                              Container(
                                width: 22.w,
                                height: 0.1.h,
                                color: signLine,
                              ),
                            ],
                          ),
                        )
                      ),
                      SizedBox(
                        height: 1.h,
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
                                height: 1.5.h,
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
                                        cubit.loginClearData();
                                      },
                                      text: AppString.forgotPassword,
                                      context: context,
                                      size: 15)
                                ],
                              ),
                              //SizedBox(height: 1.h,),
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
                                  text: state is LoginLoadingState
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : StringUtils.capitalize(
                                          AppString.loginTitle),
                                  width: AppSizes.width(context) * 0.4,
                                  height: AppSizes.height(context) * 0.066,
                                  radius: AppSizes.defaultBottomRadius,
                                  isLoading: state is LoginLoadingState
                                      ? true
                                      : false),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      AppString.haveAccount,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 16.sp,
                                            color: textButtonColor
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
                                    size: 17,
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
        }));
  }
}
