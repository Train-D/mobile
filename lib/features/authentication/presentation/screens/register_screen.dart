import 'package:basic_utils/basic_utils.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/features/layout/presentation/screens/home_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/auth_components.dart';
import '../controller/register_cubit/register_cubit.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegisterCubit(sl(), sl()),
          ),
        ],
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            if (state is RegisterSuccessState) {
              SharedComponents.navigateToReplace(
                const LoginScreen(),
                context,
              );
              SharedComponents.showToast(
                text: cubit.authResponseModel.message,
                color: Colors.green,
              );
              cubit.registerClearData();
            }
            if (state is GetGoogleSignInTokenFromBackSuccessState) {
              //if (cubit.googleModel.message == 'login successfully') {
              CacheHelper.saveData(
                  key: 'token', value: cubit.googleModel.token);
              SharedComponents.navigateToReplace(
                const HomeScreen(),
                context,
              );
              SharedComponents.showToast(
                text: 'Sign In Successfully',
                color: Colors.green,
              );
              cubit.registerClearData();
            }
            if (state is RegisterErrorState) {
              SharedComponents.showAlertDialog(
                  context: context,
                  title: 'Error!',
                  message: cubit.authResponseModel.message,
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
          },
          builder: (context, state) {
            RegisterCubit cubit = RegisterCubit.get(context);
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
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
                          height: 23.h,
                        ),
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
                            state is GetGoogleSignInTokenFromBackLoadingState
                                ? const CircularProgressIndicator()
                                : AuthComponents.signLogo(
                                    raduis: AppSizes.socialLogoRaduis,
                                    logoImage: google,
                                    function: () async {
                                      //await AuthClass.googleSignOut();
                                      var idToken =
                                          await AuthClass.googleSignIn(context);
                                      if (idToken != null) {
                                        await cubit
                                            .getGoogleSignInTokenFromBack(
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
                          height: 4.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Form(
                            key: cubit.registerFormKey,
                            autovalidateMode: cubit.autoValidationMode,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: SharedComponents.defaultTextField(
                                        controller: cubit.signUpFirstNameCon,
                                        type: TextInputType.text,
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'This field must not be empty';
                                          }
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
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'This field must not be empty';
                                          }
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
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'This field must not be empty';
                                    }
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
                                  controller: cubit.signUpUsernameCon,
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
                                  controller: cubit.signUpPasswordCon,
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
                                    function: () async {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      if (cubit.registerFormKey.currentState!
                                          .validate()) {
                                        await cubit.userRegister(
                                          firstName:
                                              cubit.signUpFirstNameCon.text,
                                          lastName:
                                              cubit.signUpLastNameCon.text,
                                          password:
                                              cubit.signUpPasswordCon.text,
                                          email: cubit.signUpEmailCon.text,
                                          userName:
                                              cubit.signUpUsernameCon.text,
                                        );
                                      } else {
                                        cubit.changeAutoValidationMode();
                                      }
                                    },
                                    text: state is RegisterLoadingState
                                        ? Center(
                                            child: CircularProgressIndicator())
                                        : StringUtils.capitalize(
                                            AppString.signUpTitle),
                                    width: AppSizes.width(context) / 3,
                                    height: AppSizes.height(context) / 14,
                                    radius: AppSizes.defaultBottomRadius,
                                    isLoading: state is RegisterLoadingState
                                        ? true
                                        : false),
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
        ));
  }
}

class AuthClass {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<String?> googleSignIn(BuildContext context) async {
    String? id;
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      if (googleSignInAccount != null) {
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        id = googleSignInAuthentication.idToken;
        print('sssss${googleSignInAuthentication.idToken}');

        // final snackBar = SnackBar(
        //   content: Text(
        //     'sign with google successfully',
        //   ),
        //   backgroundColor: lightDefualtColor,
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      print("error sign with google");
      final snackBar = SnackBar(
        content: Text('error sign with google'),
        backgroundColor: lightDefualtColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return id;
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
    print('google sign out');
  }
}
