import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/app/presentation/components/onboarding.dart';
import 'package:traind_app/features/authentication/presentation/screens/login_screen.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: onBoardingBg,
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
                  title: AppString.onboardingTwoTitle,
                  body: AppString.onboardingTwoSubtitle,
                  context: context,
                  image: AppConstants.onboardingVectorTwo,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SharedComponents.defaultButton(
                      function: () {
                        SharedComponents.navigateToReplace(
                          LoginScreen(),
                          context,
                        );
                      },
                      text: AppString.getStarted,
                      context: context,
                      width: AppConstants.width(context) * 0.4,
                      height: 6.h,
                      withIcon: false,
                      radius: 8.sp
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
