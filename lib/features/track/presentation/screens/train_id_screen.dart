import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/app_sizes.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/track/presentation/controller/tracking_cubit/tracking_cubit.dart';

class TrainIdScreen extends StatelessWidget {
  const TrainIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCubit, TrackingState>(builder: (context, state) {
      TrackingCubit cubit = TrackingCubit.get(context);
      return SafeArea(
          child: SharedComponents.screenBg(
        imageUrl: '${AppConstants.imagesUrl}$trainIdBg',
        context: context,
        child: Scaffold(
          appBar: SharedComponents.defualtAppBar(context),
          backgroundColor: transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(children: [
                Container(
                  width: double.infinity,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.sp),
                        topRight: Radius.circular(30.sp)),
                    gradient: const LinearGradient(
                      colors: trainIdBottomSheetColor,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 6.h),
                      Container(
                        width: 90.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.sp),
                            color: trainIdCardColor),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Container(
                        width: 80.w,
                        height: 30.h,
                        color: transparent,
                        child: Column(
                          children: [
                            Text(
                              AppString.trainIdTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              AppString.trainIdSubTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(color: trainIdSubTitleColor),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 5.5.h,
                              child: SharedComponents.defaultTextField(
                                  controller: cubit.trainId,
                                  bgColor: trainIdTextFieldColor,
                                  textColor: trainIdTextColor,
                                  type: TextInputType.text,
                                  validate: (e) {},
                                  label: 'Train ID'),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 7.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: stationDetailsBgColor
                                ),
                                child: Image.asset('${AppConstants.vectorsUrl}$trainIdArrowVector'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ));
    });
  }
}
