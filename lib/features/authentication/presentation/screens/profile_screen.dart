import 'package:flutter/material.dart';
import 'package:traind_app/core/utils/app_sizes.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/authentication/presentation/controller/profile_cubit/profile_cubit.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return SharedComponents.linearGradientBg(
            colors: profileBg,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: SharedComponents.defualtAppBar(context),
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      CircleAvatar(
                        radius: 40.sp,
                        backgroundColor: cameraBG,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.sp),
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
                                      controller: cubit.profileLastNameCon,
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
                                controller: cubit.profileUsernameCon,
                                type: TextInputType.text,
                                validate: (e) {
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
                                controller: cubit.profileEmailCon,
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
                                controller: cubit.profilePhoneCon,
                                type: TextInputType.phone,
                                validate: (e) {
                                  return null;
                                },
                                label: AppString.phoneNumber,
                                radius: AppSizes.textFormFieldRadius,
                                bgColor: textFormBgColor,
                                textColor: textFormTextColor,
                              ),
                              SizedBox(
                                height: AppSizes.spaceBetweenFields,
                              ),
                              SharedComponents.defaultTextField(
                                controller: cubit.profileCityCon,
                                type: TextInputType.text,
                                validate: (e) {
                                  return null;
                                },
                                label: AppString.city,
                                radius: AppSizes.textFormFieldRadius,
                                bgColor: textFormBgColor,
                                textColor: textFormTextColor,
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
                                text: AppString.save,
                                width: AppSizes.width(context) / 3,
                                height: AppSizes.height(context) / 14,
                                radius: AppSizes.defaultBottomRadius,
                              ),
                              //SizedBox(height: 20.h,)
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