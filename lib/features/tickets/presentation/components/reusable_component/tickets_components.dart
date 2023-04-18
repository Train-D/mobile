import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/global/theme/theme_data/theme_data_light.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/components.dart';


class TicketsComponents {
  static Widget defaultDropDownButton(BuildContext context) => Container(
        width: AppSizes.width(context) * 0.25,
        height: AppSizes.height(context) * 0.056,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(235, 234, 234, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: DropdownButton(
            onChanged: (value) {},
            value: "Select",
            icon: const Icon(Icons.keyboard_arrow_down),
            items: [
              DropdownMenuItem(
                value: "Select",
                child: Text(
                  AppString.select,
                  //style: TextStyle(color: Color.fromRGBO(120, 118, 118, 1), fontSize: 18.sp),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: fromToDropDownBgColor),
                ),
              ),
            ],
          ),
        ),
      );

  static Widget labelField(
          {required String text,
          required dynamic field,
          required BuildContext context}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$text:',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
          ),
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
            height: AppSizes.height(context) * 0.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              gradient: LinearGradient(
                colors: fromToBottomSheetBg,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(children: const []),
            ),
          ),
        ),
      );

  static twoText({
    required BuildContext context,
    required String title,
    required String label,
  }) =>
      Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                ),
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 15, fontWeight: FontWeight.w100),
          ),
        ],
      );

  static idNumberContainer({
    required BuildContext context,
    required String idNumber,
  }) =>
      Container(
        width: 328,
        height: 40,
        color: lightDefualtColor,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            idNumber,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                ),
          ),
        ),
      );

  static priceRow({
    required BuildContext context,
    required double price,
  }) =>
      Row(
        children: [
          Text(
            AppString.price,
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
          ),
          Text(
            '$price EGP',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w100,
                  fontSize: 20,
                ),
          ),
        ],
      );

  static defaultAlertDialog({
    required double height,
    required Widget content,
  }) =>
      AlertDialog(
        content: SharedComponents.defaultBgContainer(
            height: height,
            isLinearGradient: true,
            linearGradientbgColor: ticketAlertDialogColor,
            topRedius: 10,
            bottomRedius: 10,
            child: content),
        contentPadding: const EdgeInsets.all(0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(10),
        )),
      );
}
