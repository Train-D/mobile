import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/app/presentation/components/onboarding.dart';
import 'package:traind_app/features/app/presentation/screens/onboarding2_screen.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xe66f5246), Color(0xe6404232)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.sp,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              onboarding(
                title: AppString.onboardingOneTitle,
                body: AppString.onboardingOneSubtitle,
                context: context,
                image: AppConstants.onboardingVectorOne,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SharedComponents.defaultButton(
                      function: () {
                        SharedComponents.navigateToReplace(
                            const OnboardingTwoScreen(), context);
                      },
                      text: 'Skip',
                      //size: 18.sp,
                      context: context,
                      icon: Icons.arrow_forward_ios,
                      width: 25.w,
                      height: 6.h,
                      radius: 8.sp,
                      withIcon: true,
                      iconSize: 15,
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
