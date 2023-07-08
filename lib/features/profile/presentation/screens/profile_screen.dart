import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../components/profile_components.dart';
import 'display_profile_picture.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../controller/profile_cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
            listener: (context, state) {
      if (state is ProfileFailureUserDataState ||
          State is ProfileFailurePostUserDataState) {
        SharedComponents.showAlertDialog(
            context: context,
            title: 'Error!',
            message: 'Connection Error',
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
      if (state is ProfileSuccessPostUserDataState) {
        SharedComponents.showToast(
          text: 'Saved Successfully',
          color: Colors.green,
        );
      }},
      builder: (context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SharedComponents.linearGradientBg(
                colors: profileBg,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: SharedComponents.defaultAppBar(context: context),
                  body: state is ProfileLoadingUserDataState ||
                          state is ProfileFailureUserDataState
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                Stack(children: [
                                  InkWell(
                                    onTap: () async {
                                      if (CacheHelper.getData(
                                          key: 'isProfileImage')) {
                                        ProfileComponents.profileImageOptions(
                                            context, [
                                          ProfileComponents.option(
                                              function: () {
                                                Navigator.pop(context);
                                                SharedComponents.navigateTo(
                                                  const DisplayProfilePicture(),
                                                  context,
                                                );
                                              },
                                              icon: Icons.person,
                                              text: 'See profile picture',
                                              context: context),
                                          ProfileComponents.option(
                                              function: () {
                                                cubit.removeProfilePicture();
                                                Navigator.pop(context);
                                              },
                                              icon: Icons.delete,
                                              text: 'Remove profile picture',
                                              context: context),
                                        ]);
                                      }
                                    },
                                    child: SharedComponents.profilePicture(
                                      isProfileImage: CacheHelper.getData(
                                          key: 'isProfileImage'),
                                      image: (CacheHelper.getData(
                                                  key: 'isProfileImage') ==
                                              false
                                          ? '${AppConstants.imagesUrl}$profileIntialImage'
                                          : cubit.base64ToImage(
                                              cubit.base64Image!)),
                                      radius: 40.sp,
                                      imgHeigh: 50.sp,
                                      imgWidth: 50.sp,
                                    ),
                                  ),
                                  Positioned(
                                    top: 90,
                                    right: 0,
                                    child: CircleAvatar(
                                      //radius: 17.sp,
                                      backgroundColor: lightColor,
                                      child: FittedBox(
                                        child: IconButton(
                                          onPressed: () {
                                            ProfileComponents
                                                .profileImageOptions(context, [
                                              ProfileComponents.option(
                                                  function: () async {
                                                    await cubit
                                                        .pickImageFromCamera();
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icons.camera_alt,
                                                  text: 'Take profile picture',
                                                  context: context),
                                              ProfileComponents.option(
                                                  function: () async {
                                                    await cubit
                                                        .pickImageFromGallery();
                                                    // ignore: use_build_context_synchronously
                                                    Navigator.pop(context);
                                                  },
                                                  icon: Icons.image,
                                                  text:
                                                      'Select profile picture',
                                                  context: context),
                                            ]);
                                          },
                                          icon: const Icon(
                                            Icons.camera_alt,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.sp),
                                  child: Form(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: SharedComponents
                                                  .defaultTextField(
                                                controller:
                                                    cubit.profileFirstNameCon,
                                                type: TextInputType.text,
                                                validate: (e) {
                                                  return null;
                                                },
                                                label: AppString.firstName,
                                                radius: AppSizes
                                                    .textFormFieldRadius,
                                                bgColor: textFormBgColor,
                                                textColor: textFormTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 2.w,
                                            ),
                                            Flexible(
                                              child: SharedComponents
                                                  .defaultTextField(
                                                controller:
                                                    cubit.profileLastNameCon,
                                                type: TextInputType.text,
                                                validate: (e) {
                                                  return null;
                                                },
                                                label: AppString.lasttName,
                                                radius: AppSizes
                                                    .textFormFieldRadius,
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
                                          readOnly: true,
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
                                          readOnly: true,
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
                                            function: () async {
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      new FocusNode());
                                              await cubit.putProfileUserData(
                                                image: cubit.base64Image ?? '',
                                                firstName: cubit
                                                    .profileFirstNameCon.text,
                                                lastName: cubit
                                                    .profileLastNameCon.text,
                                                phoneNumber:
                                                    cubit.profilePhoneCon.text,
                                                city: cubit.profileCityCon.text,
                                              );
                                            },
                                            text: state
                                                    is ProfileLoadingPostUserDataState
                                                ? Center(
                                                    child:
                                                        CircularProgressIndicator())
                                                : AppString.save,
                                            width: AppSizes.width(context) / 3,
                                            height:
                                                AppSizes.height(context) / 14,
                                            radius:
                                                AppSizes.defaultBottomRadius,
                                            isLoading: state
                                                    is ProfileLoadingPostUserDataState
                                                ? true
                                                : false),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                )));
      },
    );
  }
}
