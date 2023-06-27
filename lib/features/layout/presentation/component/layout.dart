import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/components.dart';

Widget homeButton({
  required String label,
  required Widget screen,
  required BuildContext context,
  
}) =>
    SharedComponents.defaultButton(
      context: context,
      function: () {
        SharedComponents.navigateTo(screen, context);
      },
      text: label,
      width: AppSizes.width(context) * 0.8,
      height: AppSizes.height(context) * 0.07,
      radius: 4.sp,
    );
