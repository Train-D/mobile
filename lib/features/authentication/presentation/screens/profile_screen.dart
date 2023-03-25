import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/authentication/presentation/controller/profile_cubit/profile_cubit.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: profileBg,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: SharedComponents.defualtAppBar(context),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      CircleAvatar(
                        radius: 42.sp,
                        backgroundColor: cameraBG,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(42.sp),
                          child: Image(
                            width: 50.w,
                            height: 50.h,
                            //fit: BoxFit.fill,
                            image: AssetImage(
                              '${AppConstants.vectorsUrl}$profileCamera',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
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
                                      controller: cubit.profileFirstNameCon,
                                      type: TextInputType.text,
                                      validate: (e) {
                                        return null;
                                      },
                                      label: 'First Name',
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
                                    child: SharedComponents.defaultTextField(
                                      controller: cubit.profileLastNameCon,
                                      type: TextInputType.text,
                                      validate: (e) {
                                        return null;
                                      },
                                      label: 'Last Name',
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
                                controller: cubit.profileUsernameCon,
                                type: TextInputType.text,
                                validate: (e) {
                                  return null;
                                },
                                label: 'Username',
                                radius: 30.sp,
                                bgColor: textFormBgColor,
                                textColor: textFormTextColor,
                                focusedRadius: true,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SharedComponents.defaultTextField(
                                controller: cubit.profileEmailCon,
                                type: TextInputType.emailAddress,
                                validate: (e) {
                                  return null;
                                },
                                label: 'Email',
                                radius: 30.sp,
                                bgColor: textFormBgColor,
                                textColor: textFormTextColor,
                                focusedRadius: true,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SharedComponents.defaultTextField(
                                controller: cubit.profilePhoneCon,
                                type: TextInputType.phone,
                                validate: (e) {
                                  return null;
                                },
                                label: 'Phone Number',
                                radius: 30.sp,
                                bgColor: textFormBgColor,
                                textColor: textFormTextColor,
                                focusedRadius: true,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SharedComponents.defaultTextField(
                                controller: cubit.profileCityCon,
                                type: TextInputType.text,
                                validate: (e) {
                                  return null;
                                },
                                label: 'City',
                                radius: 30.sp,
                                bgColor: textFormBgColor,
                                textColor: textFormTextColor,
                                focusedRadius: true,
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              SharedComponents.defaultButton(
                                context: context,
                                function: () {
                                  // SharedComponents.navigateToReplace(
                                  //   LoginScreen(),
                                  //   context,
                                  // );
                                },
                                text: 'Save',
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
            ));
      }),
    );
  }
}
