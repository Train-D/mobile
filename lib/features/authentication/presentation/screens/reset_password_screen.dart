import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/utils/app_strings.dart';
import '../controller/reset_password_cubit/reset_password_cubit.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/components.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
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
         SharedComponents.showAlertDialog(
              context: context,
              title: 'Note...',
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
      },
      builder: (context, state) {
        ResetPasswordCubit cubit = ResetPasswordCubit.get(context);
        return SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: 
          SharedComponents.linearGradientBg(
            colors: onBoardingBg,
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
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                //fontSize: 17.5.sp,
                                color: cardTextCvvColor),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        AppString.emailAdrress,
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                //fontSize: 17.5.sp,
                                //fontWeight: FontWeight.bold,
                                color: cardTextCvvColor),
                      ),
                      SizedBox(
                        height: 1.h,
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
                          label: AppString.email,
                          radius: 10,
                          bgColor: trainIdSubTitleColor),
                      SizedBox(
                        height: 2.h,
                      ),
                      state is ResetPasswordLoadingState
                          ? Center(child: CircularProgressIndicator())
                          : Center(
                              child: SharedComponents.defaultButton(
                                  context: context,
                                  function: () {
                                     FocusScope.of(context)
                                            .requestFocus(new FocusNode());
                                            
                                    cubit.resetPassword();
                                  },
                                  text: AppString.sendInstructions,
                                  radius: 10,
                                  //width: 50.w,
                                  height: 6.5.h),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        );
      },
    );
  }
}
