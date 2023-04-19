import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/track/presentation/screens/tracking.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../controller/tracking_cubit/tracking_cubit.dart';

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
          resizeToAvoidBottomInset: false,
          appBar: SharedComponents.defaultAppBar(context: context),
          backgroundColor: transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(children: [
                SharedComponents.defaultBgContainer(
                  height: 45.h,
                  topRedius: 30.sp,
                  isLinearGradient: true,
                  linearGradientbgColor: trainIdBottomSheetColor,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 6.h),
                      SharedComponents.defaultBgContainer(
                        width: 90.w,
                        height: 31.h,
                        topRedius: 20.sp,
                        bottomRedius: 20.sp,
                        isLinearGradient: false,
                        bgColor: trainIdCardColor,
                      )
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
                                  validate: (e) {
                                    return null;
                                  },
                                  label: 'Train ID'),
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            InkWell(
                              onTap: () {
                                SharedComponents.navigateTo(
                                    trackingScreen(), context);
                              },
                              child: Container(
                                height: 7.h,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: stationDetailsBgColor),
                                child: Image.asset(
                                    '${AppConstants.vectorsUrl}$trainIdArrowVector'),
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
