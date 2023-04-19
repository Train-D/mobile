import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';

class TrackingComponents {
  static Future bottomModelSheet(
          BuildContext context,
          String currTime,
          String timeToArrive,
          String formbegin,
          String formEnd,
          double fraction) =>
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
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
                    SizedBox(
                      width: 1.w,
                    ),
                    SizedBox(
                        height: 3.h,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              formbegin,
                              style: TextStyle(fontSize: 13.sp),
                            ))),
                    Spacer(),
                    Text(
                      timeToArrive,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    SizedBox(
                        height: 3.h,
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              formEnd,
                              style: TextStyle(fontSize: 13.sp),
                            ))),
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
                              FractionallySizedBox(
                                widthFactor: fraction,
                                child: Container(
                                  height: 1.h,
                                  decoration: BoxDecoration(
                                      color: fractionalbox,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.sp))),
                                ),
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
                            child: Image.asset(
                                '${AppConstants.vectorsUrl}$train')),
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
                      AppString.from,
                      style: Theme.of(context).textTheme.displayMedium,
                    )
                  ],
                ),
                //SizedBox(height: 1.h,),
                Center(
                  child: Text('00:45:10', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 20.sp),),
                ),
                Center(
                  child: Text('HOURS:MINUTES:SECONDS', style: Theme.of(context).textTheme.displayMedium!.copyWith(fontSize: 12.sp),),
                )
              ]),
            ),
          ),
        ),
      );
}
