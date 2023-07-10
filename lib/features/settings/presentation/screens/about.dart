import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/components.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SharedComponents.screenBg(
      imageUrl: '${AppConstants.imagesUrl}aboutbg.png',
      context: context,
      child: SharedComponents.linearGradientBg(
        child: Scaffold(
          appBar: SharedComponents.defaultAppBar(
            context: context,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'About Us',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 22.sp),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    'We are a one-stop destination for all your railway ticket booking needs. Our mission is to simplify the process of securing train reservations and provide you with a seamless, hassle-free experience.',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 17.sp),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //Spacer(),
                  SharedComponents.defaultBgContainer(
                      height: 50.h,
                      topRedius: 20.sp,
                      isLinearGradient: false,
                      bgColor: aboutContainerBg,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.sp),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 6.h,
                              ),
                              Text(
                                'Our Services',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontSize: 20.sp),
                              ),
                              SizedBox(
                                height: 1.5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.all(15.sp),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 1.h,
                                          width: 1.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.sp),
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Seat Availability',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(fontSize: 16.5.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 1.h,
                                          width: 1.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.sp),
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Train Schedule',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(fontSize: 16.5.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 1.h,
                                          width: 1.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.sp),
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Live Train Tracking',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(fontSize: 16.5.sp),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 3.h,),
                                    Row(
                                      children: [
                                        Container(
                                          height: 1.h,
                                          width: 1.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100.sp),
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Ticket Booking',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .copyWith(fontSize: 16.5.sp),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                      )),
                ],
              ),
            ),
          ),
        ),
        colors: aboutBg,
      ),
    );
  }
}
