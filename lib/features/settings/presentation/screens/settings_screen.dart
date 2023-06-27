import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../../../authentication/presentation/screens/login_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../components/components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SharedComponents.linearGradientBg(
        colors: profileBg,
        child: Scaffold(
          backgroundColor: transparent,
          appBar: SharedComponents.defaultAppBar(context: context),
          body: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35.sp,
                      backgroundColor: cameraBG,
                      child: SharedComponents.profilePicture(
                        image: '${AppConstants.imagesUrl}$profileIntialImage',
                        radius: 35.sp,
                        imgHeigh: 15.h,
                        imgWidth: 15.w,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'User name',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SharedComponents.defaultButton(
                        bgColor: settingsColor,
                        context: context,
                        function: () {
                          SharedComponents.navigateTo(
                            const ProfileScreen(),
                            context,
                          );
                        },
                        text: AppString.editProfile,
                        width: 40.w,
                        radius: 8.sp,
                        withIcon: true,
                        icon: Icons.arrow_forward_ios,
                        iconSize: 18.sp),
                  ],
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Expanded(
                child: Container(
                  width: AppSizes.width(context),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: settingsContainerBgColor,
                    ),
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20.sp),
                      topEnd: Radius.circular(20.sp),
                    ),
                  ),
                  child: Column(
                    children: [
                      SettingsComponents.titleContainer(
                        context: context,
                        title: AppString.general,
                      ),
                      SettingsComponents.settingsDefualtContainer(
                          preIcon: Icons.language,
                          title: 'Language',
                          context: context,
                          text: 'English'),
                      SettingsComponents.settingsDefualtContainer(
                        preIcon: Icons.location_on_outlined,
                        title: 'Location',
                        context: context,
                      ),
                      SharedComponents.defaultButton(
                        context: context,
                        function: () async {
                          //CacheHelper.resetPreference();
                          await CacheHelper.removeData(key: 'userData');
                          await CacheHelper.removeData(key: 'token');
                          AppConstants.widget = const LoginScreen();
                          // ignore: use_build_context_synchronously
                          Phoenix.rebirth(context);
                          // //Restart.restartApp(webOrigin: '${Uri.base}');
                          // SharedComponents.navigateToRemove(
                          //     context, const LoginScreen());
                        },
                        text: 'Logout',
                        radius: 10.sp,
                        icon: Icons.logout,
                        withIcon: true,
                        iconSize: 18.sp,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
