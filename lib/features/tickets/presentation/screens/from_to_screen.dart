import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/global/theme/app_color/app_color_light.dart';
import 'package:traind_app/core/utils/app_constants.dart';
import 'package:traind_app/core/utils/app_images.dart';
import 'package:traind_app/core/utils/components.dart';
import 'package:traind_app/features/tickets/presentation/components/tickets_components.dart';
import 'package:traind_app/features/tickets/presentation/controller/from_to_cubit/from_to_cubit.dart';

class FromToScreen extends StatelessWidget {
  const FromToScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = AppConstants.height(context);
    double w = AppConstants.width(context);
    return BlocBuilder<FromToCubit, FromToState>(builder: (context, state) {
      FromToCubit cubit = FromToCubit.get(context);
      return SafeArea(
        child: SharedComponents.screenBg(
          imageUrl: '${AppConstants.imagesUrl}$fromTo',
          context: context,
          child: Scaffold(
            appBar: SharedComponents.defualtAppBar(context),
            backgroundColor: fromToBgColor,
            body: Center(
              child: Container(
                height: h * 0.5,
                width: w * 0.8,
                child: Card(
                  color: fromToCardBgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: LayoutBuilder(
                    builder: (ctx, constrains) => Column(
                      children: [
                        Container(
                          height: constrains.maxHeight * 0.35,
                          padding:
                              EdgeInsets.only(top: 30, left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TicketsComponents.labelField(
                                  text: 'From',
                                  field:
                                      TicketsComponents.defaultDropDownButton(
                                          context),
                                  context: context),
                              TicketsComponents.labelField(
                                  text: 'To',
                                  field:
                                      TicketsComponents.defaultDropDownButton(
                                          context),
                                  context: context)
                            ],
                          ),
                        ),
                        Container(
                          height: constrains.maxHeight * 0.3,
                          
                          padding: EdgeInsets.only(left: 30, right: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TicketsComponents.labelField(
                                  context: context,
                                  text: 'Date',
                                  field: SizedBox(
                                    width: constrains.maxWidth * 0.77,
                                    child: SharedComponents.defaultTextField(
                                        controller: cubit.fromToDateCon,
                                        type: TextInputType.datetime,
                                        validate: (e) {},
                                        label: 'dd/mm/yyyy',
                                        radius: 10.sp,
                                        bgColor: dateFieldColor,
                                        preIcon: Icons.calendar_month,
                                        onChange: (e) {
                                          cubit.fromToDateCon.text = e;
                                        },
                                        prePressed: () =>
                                            TicketsComponents.datePicker(
                                                context: context,
                                                datecontroller:
                                                    cubit.fromToDateCon)),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: constrains.maxHeight * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SharedComponents.defaultButton(
                                function: () {
                                  TicketsComponents.bottomModelSheet(context);
                                },
                                text: 'Search',
                                //size: 20.sp,
                                context: context,
                                width: constrains.maxWidth * 0.8,
                                height: constrains.maxHeight * 0.13,
                                radius: 8.sp,
                                withIcon: false),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
