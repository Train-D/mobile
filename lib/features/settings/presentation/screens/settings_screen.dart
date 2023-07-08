import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/settings/presentation/controller/setting_user_data_cubit/setting_user_data_cubit.dart';
import '../../../../core/services/services_locator.dart';
import 'change_password_screen.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SettingUserDataCubit(sl()),
          )
        ],
        child: BlocConsumer<SettingUserDataCubit, SettingUserDataState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            SettingUserDataCubit cubit = SettingUserDataCubit.get(context);
            return SharedComponents.linearGradientBg(
              colors: profileBg,
              child: Scaffold(
                backgroundColor: transparent,
                appBar: SharedComponents.defaultAppBar(context: context),
                body: state is SettingUserDataLoadingState
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 35.sp,
                                  backgroundColor: cameraBG,
                                  child: SharedComponents.profilePicture(
                                    
                                    image: 
                                   cubit.image == ''
                                        ? '${AppConstants.imagesUrl}$profileIntialImage'
                                        : 
                                        cubit.base64ToImage(cubit.image),
                                    radius: 35.sp,
                                    isProfileImage: cubit.image == '' ? false: true,
                                    imgHeigh: 50.h,
                                    imgWidth: 50.w,
                                  ),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Text(
                                  cubit.userName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium,
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
                                    width: 45.w,
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
                                    title: AppString.safety,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SettingsComponents
                                        .settingsDefualtContainer(
                                      preIcon: Icon(
                                        Icons.language,
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                      title: 'Language',
                                      context: context,
                                      text: 'English',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      SharedComponents.navigateTo(
                                          ChangePasswordScreen(), context);
                                    },
                                    child: SettingsComponents
                                        .settingsDefualtContainer(
                                      preIcon: ImageIcon(
                                        AssetImage(
                                            '${AppConstants.vectorsUrl}safety.png'),
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                      title: 'Security & Password',
                                      context: context,
                                    ),
                                  ),
                                  SharedComponents.defaultButton(
                                    context: context,
                                    function: () async {
                                      //CacheHelper.resetPreference();
                                      await CacheHelper.removeData(
                                          key: 'userData');
                                      await CacheHelper.removeData(
                                          key: 'token');
                                      AppConstants.widget =
                                          const LoginScreen();
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
            );
          },
        ));
  }
}
