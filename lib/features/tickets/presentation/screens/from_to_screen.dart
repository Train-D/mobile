import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/tickets/presentation/screens/choose_seats_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/reusable_component/tickets_components.dart';
import '../controller/from_to_cubit/from_to_cubit.dart';

class FromToScreen extends StatelessWidget {
  const FromToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FromToCubit, FromToState>(builder: (context, state) {
      FromToCubit cubit = FromToCubit.get(context);
      return SafeArea(
        child: SharedComponents.screenBg(
          imageUrl: '${AppConstants.imagesUrl}$fromTo',
          context: context,
          child: Scaffold(
            appBar: SharedComponents.defaultAppBar(context: context),
            backgroundColor: fromToBgColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: SharedComponents.defaultBgContainer(
                      isLinearGradient: false,
                      bgColor: fromToCardBgColor,
                      topRedius: 17.sp,
                      bottomRedius: 17.sp,
                      height: 40.h,
                      width: 80.w,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(25.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 65.w,
                                  // height: 10.h,
                                  child: Column(
                                    children: [
                                      TicketsComponents.FromToLabel(context),
                                      SizedBox(height: 1.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () => cubit.getStations(),
                                            child: (state is FromToStationsLoadingState? CircularProgressIndicator() : TicketsComponents.defaultDropDownButton(context, cubit.allStations, cubit.changeDropDownButtonValue, cubit.fromDefaultValue)) 
                                          ),
                                          GestureDetector(
                                            //onTap: () => cubit.getStations(),
                                            child: TicketsComponents.defaultDropDownButton(context, cubit.fromToStations, cubit.changeDropDownButtonValue, cubit.fromDefaultValue) 
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                              SizedBox(height: 2.h),
                              SizedBox(
                                width: 65.w,
                                child: TicketsComponents.labelField(
                                    context: context,
                                    text: AppString.date,
                                    field: SizedBox(
                                      width: 65.w,
                                      height: 6.h,
                                      child: SharedComponents.defaultTextField(
                                          controller: cubit.fromToDateCon,
                                          type: TextInputType.text,
                                          validate: (e) {
                                            return null;
                                          },
                                          label: AppString.defaultDatePattern,
                                          radius: 10.sp,
                                          bgColor: dateFieldColor,
                                          preIconFound: true,
                                          preIcon: Icons.calendar_month,
                                          onChange: (e) {},
                                          prePressed: () =>
                                              TicketsComponents.datePicker(
                                                  context: context,
                                                  datecontroller:
                                                      cubit.fromToDateCon)),
                                    )),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              SizedBox(
                                width: 65.w,
                                height: 6.h,
                                child: SharedComponents.defaultButton(
                                    function: () {
                                      /*TicketsComponents.bottomModelSheet(
                                          context);*/
                                      SharedComponents.navigateTo(
                                        const ChooseSeatsScreen(),
                                        context,
                                      );
                                    },
                                    text: AppString.search,
                                    //size: 20.sp,
                                    context: context,
                                    radius: AppSizes.defaultBottomRadius,
                                    withIcon: false),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
