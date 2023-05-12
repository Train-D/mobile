import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import 'onboarding_one_screen.dart';

class SplashScreen extends StatefulWidget {
  Widget nextScreen;
  SplashScreen({
    Key? key,
    required this.nextScreen,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => SharedComponents.navigateToReplace(
            widget.nextScreen, context));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SharedComponents.screenBg(
        context: context,
        imageUrl: '${AppConstants.imagesUrl}$splashImage',
        child: Scaffold(
          backgroundColor: splashBgColor,
          body: Center(
            child: Column(
              children: [
                const Spacer(),
                Text(
                  AppString.appName,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontFamily: 'Grechen Fuemen',
                    color: lightColor,
                  ),
                ),
                Image(
                    image:
                        AssetImage('${AppConstants.vectorsUrl}$splashVector')),
                const Spacer(),
                const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
