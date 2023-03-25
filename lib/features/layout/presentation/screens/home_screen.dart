import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/features/authentication/presentation/screens/profile_screen.dart';
import 'package:traind_app/features/layout/presentation/component/layout.dart';
import 'package:traind_app/features/layout/presentation/controller/home_cubit/home_cubit.dart';
import 'package:traind_app/features/layout/presentation/controller/home_cubit/home_state.dart';
import 'package:traind_app/features/tickets/presentation/screens/from_to_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      HomeCubit cubit = HomeCubit.get(context);
      return SharedComponents.screenBg(
          imageUrl: '${AppConstants.imagesUrl}$home',
          context: context,
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  width: double.infinity,
                  height: AppConstants.height(context) * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.sp),
                        topRight: Radius.circular(30.sp)),
                    gradient: LinearGradient(
                      colors: homeBg,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      homeButton(
                          label: AppString.tickets,
                          Screen: FromToScreen(),
                          context: context),
                      SizedBox(
                        height: AppConstants.height(context) * 0.02,
                      ),
                      homeButton(
                          label: AppString.track,
                          Screen: FromToScreen(),
                          context: context),
                      SizedBox(
                        height: AppConstants.height(context) * 0.02,
                      ),
                      homeButton(
                          label: AppString.stations,
                          Screen: ProfileScreen(),
                          context: context),
                    ],
                  ),
                )
              ]),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: bottomBarBg,
                items: cubit.navItems,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  if(index != 1)
                  SharedComponents.navigateTo(cubit.screens[index], context);
                },
              )));
    });
  }
}
