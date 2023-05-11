import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/features/tickets/presentation/screens/choose_seats_screen.dart';
import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/global/theme/theme_data/theme_data_light.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_sizes.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/components.dart';
import '../components/reusable_component/tickets_components.dart';
import '../controller/from_to_cubit/from_to_cubit.dart';
import 'package:intl/intl.dart';

class FromToScreen extends StatelessWidget {
  const FromToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FromToCubit, FromToState>(listener: (context, state) {
      FromToCubit cubit = FromToCubit.get(context);
    }, builder: (context, state) {
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
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TicketsComponents
                                              .defaultDropDownButtonContainer(
                                            DropdownButton(
                                                onChanged: (value) {
                                                  cubit
                                                      .changeDropDownButtonValue(
                                                          1, value!);
                                                  cubit
                                                      .getToStationsData(value);
                                                },
                                                menuMaxHeight: 30.h,
                                                value: cubit.fromDefaultValue,
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                items: cubit.allStations
                                                    .map(
                                                      (e) => DropdownMenuItem(
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
                                          TicketsComponents
                                              .defaultDropDownButtonContainer(
                                            DropdownButton(
                                                onChanged: (value) {
                                                  cubit
                                                      .changeDropDownButtonValue(
                                                          2, value!);
                                                },
                                                menuMaxHeight: 30.h,
                                                value: cubit.toDefaultValue,
                                                icon: const Icon(
                                                    Icons.keyboard_arrow_down),
                                                items: cubit.toStations
                                                    .map(
                                                      (e) => DropdownMenuItem(
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
                                      )
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
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1),
                                      builder: (context, child) => Theme(
                                          data: lightTheme(), child: child!),
                                    );
                                    if (pickedDate != null) {
                                      cubit.changeDefualtDate(
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate));
                                      print(cubit.fromToDefaultDate);
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
                              (state is FromToLoadingState
                                  ? CircularProgressIndicator()
                                  : SizedBox(
                                      width: 65.w,
                                      height: 6.h,
                                      child: SharedComponents.defaultButton(
                                          function: () async {
                                            await cubit.tripTimes();
                                            // ignore: use_build_context_synchronously
                                            TicketsComponents.bottomModelSheet(
                                                context,
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 25.sp),
                                                  child: ListView.builder(
                                                    itemCount: cubit
                                                        .scheduleModel
                                                        .scheduleData
                                                        .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          SharedComponents
                                                              .navigateTo(ChooseSeatsScreen(),
                                                                  context);
                                                        },
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.sp),
                                                          child: Column(
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            10.sp),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    TicketsComponents.timeText(cubit
                                                                            .scheduleModel
                                                                            .scheduleData[index]
                                                                        [
                                                                        "startTime"]),
                                                                    Expanded(
                                                                        child: Image.asset(
                                                                            '${AppConstants.imagesUrl}$bar')),
                                                                    TicketsComponents.timeText(cubit
                                                                            .scheduleModel
                                                                            .scheduleData[index]
                                                                        [
                                                                        "arrivalTime"])
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
                                                ));
                                          },
                                          text: AppString.search,
                                          //size: 20.sp,
                                          context: context,
                                          radius: AppSizes.defaultBottomRadius,
                                          withIcon: false)))
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
