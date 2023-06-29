import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/utils/components.dart';

class ResetPasswordComponents {
  static alertMessage(BuildContext context, String title, String errorMessage,
          Function action) =>
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.85),
              title: Text(
                title,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Color.fromRGBO(103, 79, 68, 1),
                      //fontSize: 14.sp
                    ),
              ),
              content: SizedBox(
                height: 8.h,
                child: Center(
                  child: Expanded(
                    child: Text(
                      errorMessage,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: Color.fromRGBO(103, 79, 68, 1),
                                //fontSize: 14.sp
                              ),
                    ),
                  ),
                ),
              ),
              actions: [
                SharedComponents.defaultButton(
                    context: context, function: action, text: 'Ok')
              ],
              contentPadding: const EdgeInsets.all(0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(10),
              )),
            );
          });
}
