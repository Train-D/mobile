import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/onboarding.dart';
import 'onboarding_two_screen.dart';

class OnboardingOneScreen extends StatelessWidget {
  const OnboardingOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SharedComponents.linearGradientBg(
        colors: onBoardingBg,
        child: Scaffold(
          backgroundColor: transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.sp,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    onboarding(
                      title: AppString.onboardingOneTitle,
                      body: AppString.onboardingOneSubtitle,
                      context: context,
                      image: '${AppConstants.vectorsUrl}$onboardingVectorOne',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SharedComponents.defaultButton(
                          function: () {
                            SharedComponents.navigateToReplace(
                                const OnboardingTwoScreen(), context);
                          },
                          text: AppString.skip,
                          //size: 18.sp,
                          context: context,
                          width: AppSizes.width(context) * 0.3,
                          height: 6.h,
                          radius: AppSizes.defaultBottomRadius,
                          withIcon: true,
                          icon: Icons.arrow_forward_ios,
                          iconSize: 17.sp,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
