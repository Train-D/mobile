import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/app/presentation/components/onboarding.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

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
          padding: EdgeInsets.symmetric(horizontal: 20.sp,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              onboarding(title: AppString.onboardingTwoTitle, body: AppString.onboardingTwoSubtitle, context: context, image: AppConstants.onboardingVectorTwo),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SharedComponents.defaultButton(function: (){}, text: 'Get started', size: 18.sp, width: 35.w, height: 6.h, radius: 8.sp,withIcon: false),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
