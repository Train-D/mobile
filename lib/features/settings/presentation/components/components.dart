import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_sizes.dart';

class SettingsComponents {
  static Widget titleContainer({
    required BuildContext context,
    required String title,
  }) =>
      Container(
        width: AppSizes.width(context),
        height: 7.h,
        decoration: BoxDecoration(
          color: lightDefualtColor,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(15.sp)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: settingsTitleTextColor,
                  ),
            ),
          ),
        ),
      );
}
