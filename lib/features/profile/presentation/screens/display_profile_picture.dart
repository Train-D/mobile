import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/profile/presentation/controller/profile_cubit/profile_cubit.dart';

class DisplayProfilePicture extends StatelessWidget {
  const DisplayProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return SharedComponents.linearGradientBg(
            colors: profileBg,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: SharedComponents.defaultAppBar(context: context),
                body: Center(
                  child: SizedBox(
                      height: 50.h,
                      width: double.infinity,
                      child: Image.file(
                        File(cubit.profileImage!.path),
                        fit: BoxFit.cover,
                      )),
                )),
          );
        },
      ),
    );
  }
}
