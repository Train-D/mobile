import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:traind_app/core/utils/app_constants.dart';

class DropdownDefaultButton extends StatelessWidget {
  DropdownDefaultButton({super.key});

  @override
  Widget build(BuildContext context) {
    double h = AppConstants.height(context);
    double w = AppConstants.width(context);
    return Container(
      width: w * 0.25,
      height: h * 0.056,
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
                style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Color.fromRGBO(120, 118, 118, 1)),
              ),
              value: "Select",
            ),
          ],
        ),
      ),
    );
  }
}
