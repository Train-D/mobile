import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
    required BuildContext context,
    required String content
  }) =>
      InkWell(
        onTap: () {
          function();
        },
        child: Container(
          width: 67.w,
          height: 12.w,
          decoration: BoxDecoration(
            color: signContainerColor,
            border: Border.all(
              color: lightColor,
              width: 0.4.w,
            ),
            borderRadius: BorderRadius.all(Radius.circular(
              15.sp,
            )),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.sp, vertical: 5.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 7.w,
                  height: 7.h,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage('${AppConstants.imagesUrl}$logoImage'),
                  ),
                ),
                FittedBox(child: Text(content, style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 17.5.sp),))
              ],
            ),
          ),
        ),
      );
}
