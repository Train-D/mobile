import 'package:flutter/material.dart';

class AppConstants {
  static const String onboardingVectorOne =
      'assets/images/vectors/onboarding_vector1.png';
  static const String onboardingVectorTwo =
      'assets/images/vectors/onboarding_vector2.png';
  static double height(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = AppBar().preferredSize.height;
    double h =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight;
    return h;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String imagesUrl = 'assets/images/imgs/';
  static String vectorsUrl = '';
  static String fontsUrl = '';

}
