import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/components.dart';

import '../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../core/global/theme/theme_data/theme_data_light.dart';
import '../../../../core/utils/app_constants.dart';

class TicketsComponents {
  static Widget defaultDropDownButton(BuildContext context) => Container(
        width: AppConstants.width(context) * 0.25,
        height: AppConstants.height(context) * 0.056,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(235, 234, 234, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: DropdownButton(
            onChanged: (value) {},
            value: "Select",
            icon: Icon(Icons.keyboard_arrow_down),
            items: [
              DropdownMenuItem(
                child: Text(
                  "Select",
                  //style: TextStyle(color: Color.fromRGBO(120, 118, 118, 1), fontSize: 18.sp),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Color.fromRGBO(120, 118, 118, 1)),
                ),
                value: "Select",
              ),
            ],
          ),
        ),
      );
  static Widget labelField({
    required String text,
    required dynamic field,
    required BuildContext context
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$text:',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w700, color: Colors.black),),
          SizedBox(
            height: 1.h,
          ),
          field
        ],
      );
  static Future<DateTime?> datePicker(
          {required BuildContext context,
          required TextEditingController datecontroller}) =>
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(data: lightTheme(), child: child!),
      );
  static Future bottomModelSheet(BuildContext context) => showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            width: double.infinity,
            height: AppConstants.height(context) * 0.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                colors: fromToBottomSheetBg,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(children: []),
            ),
          ),
        ),
      );
}
