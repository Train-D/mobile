import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/network/local/cache_helper.dart';
import 'package:traind_app/features/layout/presentation/screens/home_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/onboarding.dart';
import '../../../authentication/presentation/screens/login_screen.dart';

class OnboardingTwoScreen extends StatelessWidget {
  const OnboardingTwoScreen({super.key});

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
                      title: AppString.onboardingTwoTitle,
                      body: AppString.onboardingTwoSubtitle,
                      context: context,
                      image: '${AppConstants.vectorsUrl}$onboardingVectorTwo',
                    ),
                    SharedComponents.defaultButton(
                      function: ()async {
                        await CacheHelper.saveData(
                          key: 'onBoarding',
                          value: true,
                        );
                        if (CacheHelper.getData(key: 'onBoarding') == true) {
                          // ignore: use_build_context_synchronously
                          SharedComponents.navigateToReplace(
                            const HomeScreen(),
                            context,
                          );
                        }else{
                          // ignore: use_build_context_synchronously
                          SharedComponents.navigateToReplace(
                            const LoginScreen(),
                            context,
                          );
                        }
                      },
                      text: AppString.getStarted,
                      context: context,
                      width: AppSizes.width(context) * 0.4,
                      height: 6.h,
                      withIcon: false,
                      radius: AppSizes.defaultBottomRadius,
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
