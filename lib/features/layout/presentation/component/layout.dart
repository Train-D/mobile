import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/components.dart';
Widget homeButton(
        {required String label,
        required Widget Screen,
        required BuildContext context}) =>
    SharedComponents.defaultButton(
      context: context,
      function: () {
        SharedComponents.navigateTo(Screen, context);
      },
      text: label,
      width: AppConstants.width(context) * 0.8,
      height: AppConstants.height(context) * 0.07,
      radius: 4.sp,
    );


