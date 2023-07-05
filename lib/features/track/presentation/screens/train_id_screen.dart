import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'tracking.dart';
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
    return 
    BlocConsumer<TrackingCubit, TrackingState>(
        listener: (context, state){
      TrackingCubit cubit = TrackingCubit.get(context);
      if (state is GetTrackInfoSuccessState) {
        //cubit.getPolyline(cubit.trackModel.latitude, cubit.trackModel.longitude);
       cubit.fetchPoints();
        SharedComponents.navigateTo(const TrackingScreen(), context);
      }
      if (state is GetTrackInfoFailureState) {
        SharedComponents.showAlertDialog(
            context: context,
            title: 'Error!',
            message: cubit.message,
            actions: [
              SharedComponents.defaultButton(
                  radius: 10.sp,
                  width: 20.w,
                  context: context,
                  function: () {
                    Navigator.pop(context);
                  },
                  text: 'Ok')
            ]);
      }
    }, builder: (context, state) {
      TrackingCubit cubit = TrackingCubit.get(context);
      return SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SharedComponents.screenBg(
          imageUrl: '${AppConstants.imagesUrl}Train id.png',
          context: context,
          child: Scaffold(
            //resizeToAvoidBottomInset: false,
            appBar: SharedComponents.defaultAppBar(context: context),
            backgroundColor: transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 40.h),
                    SharedComponents.defaultBgContainer(
                      width: 90.w,
                      height: 31.h,
                      topRedius: 20.sp,
                      bottomRedius: 20.sp,
                      isLinearGradient: false,
                      bgColor: trainIdCardColor,
                      child: Column(
                        children: [
                          SizedBox(height: 5.h),
                          Container(
                            width: 80.w,
                            height: 26.h,
                            color: transparent,
                            child: SingleChildScrollView(
                              child: Form(
                                key: cubit.trackingFormKey,
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
                                          validate: (String? value) {
                                            if (value!.isEmpty) {
                                              return 'This field is required';
                                            }
                                            return null;
                                          },
                                          textColor: trainIdTextColor,
                                          type: TextInputType.text,
                                          label: 'Ticket ID'),
                                    ),
                                    SizedBox(
                                      height: 1.5.h,
                                    ),
                                    state is GetTrackInfoLoadingState
                                        ? CircularProgressIndicator()
                                        : InkWell(
                                            onTap: () async {
                                              FocusScope.of(context)
                                                  .requestFocus(new FocusNode());
                                              if (cubit
                                                  .trackingFormKey.currentState!
                                                  .validate()) {
                                                await cubit.getTrackInfo(
                                                    cubit.trainId.text);
                                              }
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
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    });
  }
}
