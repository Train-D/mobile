import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../controller/reset_password_cubit/reset_password_cubit.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/components.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ResetPasswordCubit(sl()),
          ),
        ],
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {
            ResetPasswordCubit cubit = ResetPasswordCubit.get(context);
            if (state is ResetPasswordFailureState) {
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
            if (state is ResetPasswordSuccessState) {
              SharedComponents.showToast(
                  text: cubit.message, color: Colors.green);
            }
          },
          builder: (context, state) {
            ResetPasswordCubit cubit = ResetPasswordCubit.get(context);
            return GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SharedComponents.linearGradientBg(
                colors:  profileBg,
                child: Scaffold(
                  backgroundColor: transparent,
                  appBar: SharedComponents.defaultAppBar(context: context),
                  body: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.sp,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            AppString.resetPassword,
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 22.sp),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            AppString.resetPasswordInstructions,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    //fontSize: 17.5.sp,
                                    color: cardTextCvvColor),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                         
                          SharedComponents.defaultTextField(
                              controller: cubit.userEmailAddressCon,
                              type: TextInputType.text,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'This field must not be empty';
                                }
                                return null;
                              },
                              bgColor: textFormBgColor,
                              label: AppString.email,
                              radius: 25,
                              textColor: resetFormTextColor
                              ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Center(
                            child: SharedComponents.defaultButton(
                                context: context,
                                function: () {
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());

                                  cubit.resetPassword();
                                },
                                text: state is ResetPasswordLoadingState
                                    ? Center(child: CircularProgressIndicator())
                                    : AppString.sendInstructions,
                                radius: 5,
                                //width: 50.w,
                                height: 6.5.h,
                                isLoading: state is ResetPasswordLoadingState
                                    ? true
                                    : false),
                          )
                        ],
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
