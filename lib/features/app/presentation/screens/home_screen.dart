import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/features/tickets/presentation/screens/from_to_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  SharedComponents.defaultButton(
                    width: AppConstants.width(context) * 0.8,
                    height: AppConstants.height(context) * 0.07,
                    radius: 4.sp,
                    function: () {
                      SharedComponents.navigateTo(FromToScreen(), context);
                    },
                    text: 'Tickets',
                    context: context,
                  ),
                  SizedBox(height: AppConstants.height(context) * 0.02,),
                  SharedComponents.defaultButton(
                    width: AppConstants.width(context) * 0.8,
                    height: AppConstants.height(context) * 0.07,
                    radius: 4.sp,
                    function: () {},
                    text: 'Track Your Train',
                    context: context,
                  ),
                  SizedBox(height: AppConstants.height(context) * 0.02,),
                  SharedComponents.defaultButton(
                    width: AppConstants.width(context) * 0.8,
                    height: AppConstants.height(context) * 0.07,
                    radius: 4.sp,
                    function: () {},
                    text: 'Stations',
                    context: context,
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
