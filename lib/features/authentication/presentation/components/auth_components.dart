import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_images.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';

class AuthComponents {
  static Widget rectangleBg({required String image}) => Image(
        image: AssetImage(
          '${AppConstants.imagesUrl}$image',
        ),
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      );

  static Widget signLogo({
    var raduis = 0,
    required String logoImage,
    required Function function,
  }) =>
      InkWell(
        onTap: () {
          function();
        },
        child: Container(
          width: 12.w,
          height: 12.w,
          decoration: BoxDecoration(
            border: Border.all(
              color: lightColor,
              width: 0.4.w,
            ),
            borderRadius: BorderRadius.all(Radius.circular(
              15.sp,
            )),
          ),
          child: Padding(
            padding: EdgeInsets.all(5.sp),
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage('${AppConstants.imagesUrl}$logoImage'),
            ),
          ),
        ),
      );
}
