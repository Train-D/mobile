import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';

class TrackingComponents {
  static Container bottomModelSheet(
          BuildContext context,
          String arrivalTime,
          String hours,
          String mins,
          double fraction,
          String fromStation,
          String currTime,
          String distance) =>
      Container(
        width: double.infinity,
        height: 35.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.sp),
              topRight: Radius.circular(30.sp)),
          gradient: const LinearGradient(
            colors: trackingBottomModelSheet,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.sp),
            child: Column(children: [
              SizedBox(
                height: 2.h,
              ),
              Image.asset('${AppConstants.imagesUrl}$bar'),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currTime,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    arrivalTime,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.sp),
                        child: Stack(
                          children: [
                            Container(
                              height: 1.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.sp)),
                                color: cardTextCvvColor,
                              ),
                            ),
                            Container(
                              height: 1.h,
                              width: 53.sp,
                              decoration: BoxDecoration(
                                  color: fractionalbox,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.sp))),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 4.h,
                          child: Image.asset(
                              '${AppConstants.vectorsUrl}$currLocation')),
                      SizedBox(
                          height: 4.h,
                          child:
                              Image.asset('${AppConstants.vectorsUrl}$train')),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.train,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    distance,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 16.sp),
                  ),
                  Text(
                    fromStation,
                    style: Theme.of(context).textTheme.displayMedium,
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        '$hours : $mins',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 20.sp),
                      ),
                    ),
                    Center(
                      child: Text(
                        'HOURS : MINUTES',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      );
}
