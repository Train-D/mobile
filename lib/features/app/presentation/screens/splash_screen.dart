import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  final Widget nextScreen;

  SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(_animationController);

    _animationController.forward();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.nextScreen),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SharedComponents.screenBg(
        context: context,
        imageUrl: '${AppConstants.imagesUrl}$splashImage',
        child:
    SafeArea(
      child: Scaffold(
        backgroundColor: splashBgColor,
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _animation,
                    child: Text(
                      AppString.appName,
                      style: TextStyle(
                        fontSize: 30.sp,
                        fontFamily: 'Grechen Fuemen',
                        color: lightColor,
                      ),
                    ),
                  ),
                 // SizedBox(height: 3.h),
                  SlideTransition(
                    position: _animation,
                    child: Image(
                    image:
                        AssetImage('${AppConstants.vectorsUrl}$splashVector'))
                  ),
                  SizedBox(height: 15.h,)
                ],
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}


