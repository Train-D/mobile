import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppSizes {
  static double height(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = AppBar().preferredSize.height;
    double keyBoardHeight = MediaQuery.viewInsetsOf(context).bottom;
    double h =
        MediaQuery.of(context).size.height - statusBarHeight - appBarHeight - keyBoardHeight;
    return h;
  }

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double textFormFieldRadius = 30.sp;

  static double socialLogoRaduis = 15.sp;

  static double spaceBetweenFields = 1.5.h;
  
  static double defaultBottomRadius = 8.sp;
}
