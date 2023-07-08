
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/components.dart';
import '../controller/profile_cubit/profile_cubit.dart';

class DisplayProfilePicture extends StatelessWidget {
  const DisplayProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
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
                    child: cubit.base64ToImage(cubit.base64Image!)),
              )),
        );
      },
    );
  }
}
