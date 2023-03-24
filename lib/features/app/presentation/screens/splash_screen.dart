import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/app/presentation/screens/onboarding1_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => SharedComponents.navigateToReplace(Onboarding1Screen(), context));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/imgs/splash.png'), fit: BoxFit.cover)
        ),
        child: Scaffold(
          backgroundColor: Color.fromRGBO( 84, 74, 65, 0.66,),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Text(AppString.appName, style: TextStyle(fontSize: 30.sp, fontFamily: 'Grechen Fuemen', color: Colors.white), ),
                Image(image: AssetImage('assets/images/vectors/splash_vector.png')),
                Spacer(),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
