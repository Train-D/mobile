import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';

class ProfileComponents {
  static Future profileImageOptions(
          BuildContext context, List<Widget> options) =>
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
                width: double.infinity,
                height: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.sp),
                      topRight: Radius.circular(20.sp)),
                  gradient: const LinearGradient(
                    colors: trackingBottomModelSheet,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Image.asset('${AppConstants.imagesUrl}$bar'),
                    SizedBox(
                      height: 5.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: options.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.sp),
                          child: Column(
                            children: [
                              options[index],
                              SizedBox(
                                height: 3.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  static Widget option(
          {required Function function,
          required IconData icon,
          required String text,
          required BuildContext context}) =>
      InkWell(
        onTap: () => function(),
        child: Row(
          children: [
            Icon(
              icon,
              color: lightColor,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 17.sp))
          ],
        ),
      );
}
