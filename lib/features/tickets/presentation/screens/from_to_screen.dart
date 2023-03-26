import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/app_sizes.dart';
import 'package:traind_app/core/utils/app_strings.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/tickets/presentation/components/tickets_components.dart';
import 'package:traind_app/features/tickets/presentation/controller/from_to_cubit/from_to_cubit.dart';

class FromToScreen extends StatelessWidget {
  const FromToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = AppSizes.height(context);
    double w = AppSizes.width(context);
    return BlocBuilder<FromToCubit, FromToState>(builder: (context, state) {
      FromToCubit cubit = FromToCubit.get(context);
      return SafeArea(
        child: SharedComponents.screenBg(
          imageUrl: '${AppConstants.imagesUrl}$fromTo',
          context: context,
          child: Scaffold(
            appBar: SharedComponents.defualtAppBar(context),
            backgroundColor: fromToBgColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: AppSizes.height(context) * 0.25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.sp),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.sp),
                        color: fromToCardBgColor,
                      ),
                      height: h * 0.5,
                      width: w * 0.8,
                      child: LayoutBuilder(
                        builder: (ctx, constrains) => SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                //height: constrains.maxHeight * 0.35,
                                padding: const EdgeInsets.only(
                                    top: 30, left: 30, right: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TicketsComponents.labelField(
                                        text: AppString.from,
                                        field: TicketsComponents
                                            .defaultDropDownButton(context),
                                        context: context),
                                    TicketsComponents.labelField(
                                        text: AppString.to,
                                        field: TicketsComponents
                                            .defaultDropDownButton(context),
                                        context: context)
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: constrains.maxHeight * 0.02,
                              ),
                              Container(
                                //height: constrains.maxHeight * 0.3,

                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    TicketsComponents.labelField(
                                        context: context,
                                        text: AppString.date,
                                        field: SizedBox(
                                          width: constrains.maxWidth * 0.77,
                                          child:
                                              SharedComponents.defaultTextField(
                                                  controller:
                                                      cubit.fromToDateCon,
                                                  type: TextInputType.text,
                                                  validate: (e) {
                                                    return null;
                                                  },
                                                  label: AppString
                                                      .defaultDatePattern,
                                                  radius: 10.sp,
                                                  bgColor: dateFieldColor,
                                                  preIconFound: true,
                                                  preIcon: Icons.calendar_month,
                                                  onChange: (e) {},
                                                  prePressed: () =>
                                                      TicketsComponents.datePicker(
                                                          context: context,
                                                          datecontroller: cubit
                                                              .fromToDateCon)),
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: constrains.maxHeight * 0.1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SharedComponents.defaultButton(
                                      function: () {
                                        TicketsComponents.bottomModelSheet(
                                            context);
                                      },
                                      text: AppString.search,
                                      //size: 20.sp,
                                      context: context,
                                      width: constrains.maxWidth * 0.8,
                                      height: constrains.maxHeight * 0.13,
                                      radius: AppSizes.defaultBottomRadius,
                                      withIcon: false),
                                ],
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
