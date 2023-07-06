import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/components.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_sizes.dart';

class SettingsComponents {
  static Widget titleContainer({
    required BuildContext context,
    required String title,
  }) =>
      Container(
        width: AppSizes.width(context),
        height: 6.h,
        decoration: BoxDecoration(
          color: settingsColor,
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
  static Widget settingsDefualtContainer(
          {required dynamic preIcon,
          IconData suffIcon = Icons.arrow_forward_ios,
          required String title,
          String text = '',
          required BuildContext context,
          }) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 7.w),
        child: Row(
          children: [
            preIcon,
            SizedBox(
              width: 3.w,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Spacer(),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: languageTextColor, fontSize: 16.sp),
            ),
            SizedBox(
              width: 2.w,
            ),
            Icon(
              suffIcon,
              color: lightColor,
            )
          ],
        ),
      );
}
