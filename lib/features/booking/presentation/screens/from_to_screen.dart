import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'choose_seats_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/reusable_component/tickets_components.dart';
import 'package:intl/intl.dart';

import '../controller/booking_cubit/booking_cubit.dart';

class FromToScreen extends StatelessWidget {
  const FromToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingCubit, BookingState>(listener: (context, state) {
      BookingCubit cubit = BookingCubit.get(context);
      if (state is GetTripsErrorState) {
        SharedComponents.showToast(
            text: cubit.firstScreenErrorMessage, color: Colors.red);
      } else if (state is GetTripsSuccessState) {
        // ignore: use_build_context_synchronously
        TicketsComponents.bottomModelSheet(
            context,
            Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Image.asset('${AppConstants.imagesUrl}$bar'),
                SizedBox(
                  height: 3.h,
                ),
                (cubit.tripTimesModel.tripTimes.length == 0
                    ? Padding(
                        padding: EdgeInsets.all(30.sp),
                        child: Center(
                          child: Text(
                            'Oops All train trips to this destination have ended for today, Try tomorrow ...',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: settingsTitleTextColor),
                          ),
                        ),
                      )
                    : Text('')),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.tripTimesModel.tripTimes.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          cubit.getTrainInfo(
                              cubit.tripTimesModel.tripTimes[index]["tripId"],
                              cubit.fromToDefaultDate);
                          Navigator.pop(context);
                          SharedComponents.navigateTo(
                              const ChooseSeatsScreen(), context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.sp),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    TicketsComponents.timeText(cubit
                                        .tripTimesModel
                                        .tripTimes[index]["startTime"]),
                                    SizedBox(
                                      height: 2.h,
                                      width: 5.w,
                                      child: Image.asset(
                                          '${AppConstants.imagesUrl}$arrow'),
                                    ),
                                    TicketsComponents.timeText(cubit
                                        .tripTimesModel
                                        .tripTimes[index]["arrivalTime"])
                                  ],
                                ),
                              ),
                              TicketsComponents.bottomDivider()
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ));
      }
    }, builder: (context, state) {
      BookingCubit cubit = BookingCubit.get(context);
      return SharedComponents.screenBg(
        imageUrl: '${AppConstants.imagesUrl}$fromTo',
        context: context,
        child: Scaffold(
          appBar: SharedComponents.defaultAppBar(
            context: context,
          ),
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
                  child: (state is FromToStationsLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : (state is FromToStationsErrorState
                          ? RefreshIndicator(
                              onRefresh: () async {
                                cubit.getStationsFromApi();
                              },
                              child: const Text(''),
                            )
                          : SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.all(25.sp),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 65.w,
                                        // height: 10.h,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TicketsComponents.label(
                                                    context, AppString.from),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                TicketsComponents
                                                    .defaultDropDownButtonContainer(
                                                  DropdownButton(
                                                      //underline: SizedBox(height: 0.5.h,),
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  20.sp),
                                                      onChanged: (value) {
                                                        cubit
                                                            .changeDropDownButtonValue(
                                                                1, value!);
                                                        cubit
                                                            .getToStationsData(
                                                                value);
                                                      },
                                                      menuMaxHeight: 30.h,
                                                      value: cubit
                                                          .fromDefaultValue,
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                      items: cubit.allStations
                                                          .map(
                                                            (e) =>
                                                                DropdownMenuItem(
                                                              value: e,
                                                              child: Text(
                                                                e,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayMedium!
                                                                    .copyWith(
                                                                        color:
                                                                            fromToDropDownBgColor),
                                                              ),
                                                            ),
                                                          )
                                                          .toList()),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TicketsComponents.label(
                                                    context, AppString.to),
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                TicketsComponents
                                                    .defaultDropDownButtonContainer(
                                                  DropdownButton(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                                  20.sp),
                                                      onChanged: (value) {
                                                        cubit
                                                            .changeDropDownButtonValue(
                                                                2, value!);
                                                      },
                                                      menuMaxHeight: 30.h,
                                                      value: cubit
                                                          .toDefaultValue,
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                      items: cubit.toStations
                                                          .map(
                                                            (e) =>
                                                                DropdownMenuItem(
                                                              value: e,
                                                              child: Text(
                                                                e,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .displayMedium!
                                                                    .copyWith(
                                                                        color:
                                                                            fromToDropDownBgColor),
                                                              ),
                                                            ),
                                                          )
                                                          .toList()),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    SizedBox(height: 2.h),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${AppString.date}:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                      width: 65.w,
                                      child: InkWell(
                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.now()
                                                      .add(const Duration(
                                                          days: 20)),
                                                  builder: (context, child) {
                                                    return Theme(
                                                        data:
                                                            Theme.of(context)
                                                                .copyWith(
                                                          colorScheme:
                                                              ColorScheme
                                                                  .light(
                                                            primary: Color
                                                                .fromRGBO(
                                                                    65,
                                                                    49,
                                                                    42,
                                                                    1),
                                                            surface: Color
                                                                .fromRGBO(
                                                                    65,
                                                                    49,
                                                                    42,
                                                                    1),
                                                          ),
                                                          textTheme: TextTheme(
                                                              bodySmall: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displayMedium!
                                                                  .copyWith(
                                                                      fontSize:
                                                                          16.sp)),
                                                          datePickerTheme:
                                                              DatePickerThemeData(
                                                            headerHelpStyle: Theme
                                                                    .of(
                                                                        context)
                                                                .textTheme
                                                                .displayMedium!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16.sp),
                                                          ),
                                                          textButtonTheme:
                                                              TextButtonThemeData(
                                                                  style: TextButton
                                                                      .styleFrom(
                                                                          //backgroundColor: Color.fromRGBO(78, 64, 57, 1),
                                                                          textStyle:
                                                                              Theme.of(context).textTheme.displayMedium)),
                                                          // dialogBackgroundColor: Color.fromRGBO(65, 49, 42, 1),
                                                        ),
                                                        child: child!);
                                                  });
                                          if (pickedDate != null) {
                                            cubit.changeDefualtDate(
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate));
                                            //print(cubit.fromToDefaultDate);
                                          }
                                        },
                                        child: Container(
                                          width: 65.w,
                                          height: 6.h,
                                          decoration: BoxDecoration(
                                            color: dateFieldColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.sp)),
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 3.w,
                                              ),
                                              Icon(
                                                Icons.calendar_month,
                                                size: 20.sp,
                                                color: Colors.grey,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Text(
                                                cubit.fromToDefaultDate,
                                                style: TextStyle(
                                                    fontFamily: 'Inria Serif',
                                                    color: Colors.grey,
                                                    fontSize: 17.sp),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.h,
                                    ),
                                    SizedBox(
                                            width: 65.w,
                                            height: 6.h,
                                            child: SharedComponents
                                                .defaultButton(
                                                    function: () async {
                                                      await cubit
                                                          .getTripTimes();
                                                    },
                                                    text: state is GetTripsLoadingState? Center(child: CircularProgressIndicator()):
                                                    AppString.search,
                                                    //size: 20.sp,
                                                    context: context,
                                                    radius: AppSizes
                                                        .defaultBottomRadius,
                                                    withIcon: false,
                                                    isLoading: state is GetTripsLoadingState? true : false
                                                    ))
                                  ],
                                ),
                              ),
                            ))),
                )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
