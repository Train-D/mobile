import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../controller/change_password_cubit/change_password_cubit.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ChangePasswordCubit(sl()),
          )
        ],
        child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
          listener: (context, state) {
            ChangePasswordCubit cubit = ChangePasswordCubit.get(context);
            // TODO: implement listener
            if (state is ChangePasswordFailureState) {
              SharedComponents.showAlertDialog(
                  context: context,
                  title: 'Error!',
                  message: cubit.message,
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
            if (state is ChangePasswordSuccessState) {
              SharedComponents.showToast(
                  text: cubit.message, color: Colors.green);
            }
          },
          builder: (context, state) {
            ChangePasswordCubit cubit = ChangePasswordCubit.get(context);
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SharedComponents.linearGradientBg(
                colors: profileBg,
                child: Scaffold(
                  backgroundColor: transparent,
                  appBar: SharedComponents.defaultAppBar(context: context),
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.sp,
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: cubit.changePasswordFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              AppString.changePassword,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 22.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              AppString.changePasswordInstructions,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                      //fontSize: 17.5.sp,
                                      color: cardTextCvvColor),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            SharedComponents.defaultTextField(
                              controller: cubit.currPasswordCon,
                              type: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'This field must not be empty';
                                }
                                return null;
                              },
                              label: AppString.currPassword,
                              radius: AppSizes.textFormFieldRadius,
                              bgColor: textFormBgColor,
                              textColor: textFormTextColor,
                              password: cubit.currPasswordShown,
                              suffIconFound: true,
                              suffIcon: cubit.currPasswordSuffIcon,
                              suffPressed: () {
                                cubit.changeCurrPasswordVisibility();
                              },
                            ),
                            SizedBox(
                              height: AppSizes.spaceBetweenFields,
                            ),
                            SharedComponents.defaultTextField(
                              controller: cubit.newPasswordCon,
                              type: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'This field must not be empty';
                                }
                                if (value == cubit.currPasswordCon.text) {
                                  return 'Must be different from current password';
                                }
                                return null;
                              },
                              label: AppString.newPassword,
                              radius: AppSizes.textFormFieldRadius,
                              bgColor: textFormBgColor,
                              textColor: textFormTextColor,
                              password: cubit.newPasswordShown,
                              suffIconFound: true,
                              suffIcon: cubit.newPasswordSuffIcon,
                              suffPressed: () {
                                cubit.changeNewPasswordVisibility();
                              },
                            ),
                            SizedBox(
                              height: AppSizes.spaceBetweenFields,
                            ),
                            SharedComponents.defaultTextField(
                              controller: cubit.confirmPasswordCon,
                              type: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'This field must not be empty';
                                }
                                if (value != cubit.newPasswordCon.text) {
                                  return 'different from new password';
                                }
                                return null;
                              },
                              label: AppString.confirmPassword,
                              radius: AppSizes.textFormFieldRadius,
                              bgColor: textFormBgColor,
                              textColor: textFormTextColor,
                              password: cubit.confirmPasswordShown,
                              suffIconFound: true,
                              suffIcon: cubit.confirmPasswordSuffIcon,
                              suffPressed: () {
                                cubit.changeConfirmPasswordVisibility();
                              },
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Center(
                              child: SharedComponents.defaultButton(
                                  context: context,
                                  function: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    if (cubit
                                        .changePasswordFormKey.currentState!
                                        .validate()) {
                                      cubit.changePassword();
                                    }
                                    //cubit.resetPassword();
                                  },
                                  text: state is ChangePasswordLoadingState
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : AppString.changePassword,
                                  radius: 10,
                                  width: 60.w,
                                  height: 6.5.h,
                                  isLoading: state is ChangePasswordLoadingState
                                      ? true
                                      : false),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
