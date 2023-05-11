import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/global/theme/app_color/app_color_light.dart';
import '../../../../../core/global/theme/theme_data/theme_data_light.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/components.dart';

class TicketsComponents {
  static Widget defaultDropDownButtonContainer(dynamic child) => Container(
        width: 25.w,
        height: 5.h,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(235, 234, 234, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: FittedBox(
              //width: 20.w,
              child: child)),
      );

  // ignore: non_constant_identifier_names
  static Widget FromToLabel(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${AppString.from}:',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            '${AppString.to}:',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          SizedBox(
            width: 5.w,
          ),
        ],
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

  static Future bottomModelSheet(BuildContext context, Widget child) =>
      showModalBottomSheet(
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
              child: child),
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
  static timeText(String text) => Text(
        text,
        style: TextStyle(fontSize: 18.sp, fontFamily: 'jura'),
      );
  static bottomDivider() => Column(
        children: [
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 5.w,
              ),
              const Expanded(
                  child: Divider(
                color: lightColor,
              )),
              SizedBox(
                width: 5.w,
              ),
            ],
          )
        ],
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
