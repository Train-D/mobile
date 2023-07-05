import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../../../stations/presentation/screens/stations_screen.dart';
import '../../../tickets/presentation/screens/from_to_screen.dart';
import '../../../tickets/presentation/screens/user_valid_booked_tickets_screen.dart';
import '../../../track/presentation/screens/train_id_screen.dart';
import '../component/layout.dart';
import '../controller/home_cubit/home_cubit.dart';
import '../controller/home_cubit/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      HomeCubit cubit = HomeCubit.get(context);
      return SafeArea(
        child: SharedComponents.screenBg(
          imageUrl: '${AppConstants.imagesUrl}$home',
          context: context,
          child: Scaffold(
              backgroundColor: transparent,
              body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SharedComponents.defaultBgContainer(
                  isLinearGradient: true,
                  linearGradientbgColor: homeBg,
                  height: 50.h,
                  topRedius: 30.sp,
                  child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SharedComponents.defaultButton(
                              context: context,
                              function: () {
                                SharedComponents.navigateTo(
                                 FromToScreen(),
                                  //UserValidBookedTicketsScreen(),
                                  context,
                                );
                              },
                              text: AppString.booking,
                              width: AppSizes.width(context) * 0.8,
                              height: AppSizes.height(context) * 0.07,
                              radius: 4.sp,
                            ),
                            SizedBox(
                              height: AppSizes.height(context) * 0.02,
                            ),
                            homeButton(
                              label: AppString.track,
                              screen: const TrainIdScreen(),
                              context: context,
                            ),
                            SizedBox(
                              height: AppSizes.height(context) * 0.02,
                            ),
                            homeButton(
                              label: AppString.stations,
                              screen: const StationsScreen(),
                              context: context,
                            ),
                            SizedBox(
                              height: AppSizes.height(context) * 0.02,
                            ),
                            homeButton(
                              label: 'My Tickets',
                              screen: const UserValidBookedTicketsScreen(),
                              context: context,
                            ),
                          ],
                        ),
                )
              ]),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: bottomBarBg,
                items: cubit.navItems,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  //print(state);
                  if (index != 1 ) {
                    SharedComponents.navigateTo(cubit.screens[index], context);
                  }
                },
              )),
        ),
      );
    });
  }
}